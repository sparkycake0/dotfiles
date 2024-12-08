export ZSH="$HOME/.oh-my-zsh"
eval "$(starship init zsh)"
plugins=(git)
source $ZSH/oh-my-zsh.sh
plugins=(
    # other plugins...
    zsh-autosuggestions
)

### Aliases ###
alias install="sudo pacman -S"
alias delete="sudo pacman -R"
alias shell="zeditor ~/.zshrc"
alias update="sudo pacman -Syu"
alias aurinstall="yay -S"
alias aurdelete="yay -R"
alias swayconf="zeditor ~/.config/sway/config"
alias waybarconf="zeditor ~/.config/waybar"
alias roficonf="zeditor ~/.config/rofi"
alias nvimconf="zeditor ~/.config/nvim"
alias kittyconf="zeditor ~/.config/kitty/kitty.conf"
alias zshhconf="zeditor ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh"
alias starshipconf="zeditor ~/.config/starship.toml"

### Imports ###
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
