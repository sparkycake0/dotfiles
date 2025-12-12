if test -f ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences >/dev/tty
end

set -U fish_greeting ""

status --is-interactive; and starship init fish | source

set -x LIBVA_DRIVER_NAME amdgpu
set -x WLR_NO_HARDWARE_CURSORS 1
set -x WLR_DRM_NO_ATOMIC 1

# Aliases
alias find='fzf'
alias stats='fastfetch'
alias checkmem='df -h /'
alias rebuild='sudo nixos-rebuild switch'
alias del='sudo rm -rf'
alias md='mkdir'

if test -f ~/.cache/wal/colors.json
    set -x STARSHIP_ACCENT (jq -r '.colors.color4' ~/.cache/wal/colors.json)
end

if not contains $PNPM_HOME $PATH
    set -x PATH $PNPM_HOME $PATH
end

if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
    exec mango
end

set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools
set -x PATH $PATH $ANDROID_HOME/cmdline-tools/latest/bin
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x JAVA_HOME /run/current-system/sw
set -x PATH $HOME/.cargo/bin $PATH

function nvim
    command nvim $argv
    printf '\e[5 q'
end
set -x TERM foot
set -x COLORTERM truecolor

function start_tmux
    set -e TMUX

    tmux -2 new-session
end
fastfetch
