export GPG_TTY=$(tty)

export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export _JAVA_AWT_WM_NONREPARENTING=1

. "$HOME/.cargo/env"
