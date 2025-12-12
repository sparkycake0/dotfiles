use std::{
    fs,
    path::{Path, PathBuf},
    process::Command,
};

fn main() {
    let home = std::env::var("HOME").expect("HOME not set");

    // 📁 What to back up
    let config_paths = [
        ".config/nvim",
        ".config/mango",
        ".config/fastfetch",
        ".config/foot",
        ".config/helix",
        ".config/home-manager",
        ".config/mako",
        ".config/nix-config",
        ".config/rofi",
        ".config/scripts",
        ".config/starship.toml",
        ".config/tmux",
        ".config/waybar",
        ".config/yazi",
        ".config/apps/",
    ];

    // ❌ Never copy these
    let ignored = [".git", ".secrets", "node_modules", ".cache", "config.fish"];

    let dotfiles_dir = PathBuf::from(format!("{}/dotfiles", home));

    if !dotfiles_dir.exists() {
        println!("Creating {}", dotfiles_dir.display());
        fs::create_dir_all(&dotfiles_dir).unwrap();
    }

    for rel_path in config_paths {
        let src = PathBuf::from(format!("{}/{}", home, rel_path));
        if !src.exists() {
            continue;
        }

        if ignored.iter().any(|i| src.to_string_lossy().contains(i)) {
            println!("Skipping {}", src.display());
            continue;
        }

        let name = src.file_name().unwrap();
        let dest = dotfiles_dir.join(name);

        println!("Copying {} → {}", src.display(), dest.display());

        let _ = fs::remove_dir_all(&dest);

        let status = Command::new("cp")
            .args(["-r", src.to_str().unwrap(), dest.to_str().unwrap()])
            .status()
            .expect("cp failed");

        if !status.success() {
            eprintln!("❌ Failed copying {}", src.display());
            return;
        }
    }

    // 🧾 Git add
    run_git(&dotfiles_dir, &["add", "."]);

    // 📝 Commit (ignore if nothing changed)
    let commit = Command::new("git")
        .current_dir(&dotfiles_dir)
        .args(["commit", "-m", "Auto backup"])
        .status()
        .unwrap();

    if !commit.success() {
        println!("Nothing to commit");
    }

    // 🚀 Push
    let push = Command::new("git")
        .current_dir(&dotfiles_dir)
        .args(["push", "link", "master"])
        .status()
        .unwrap();

    if !push.success() {
        eprintln!("❌ Git push failed");
        return;
    }

    println!("✅ Backup completed and pushed");
}

fn run_git(dir: &Path, args: &[&str]) {
    let status = Command::new("git")
        .current_dir(dir)
        .args(args)
        .status()
        .unwrap();

    if !status.success() {
        eprintln!("❌ Git command failed: {:?}", args);
        std::process::exit(1);
    }
}
