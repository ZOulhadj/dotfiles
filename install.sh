# Script arguments:
# -h  or --help      (Print help menu)
# -nc or --noconfirm (Dont ask user for confirmation after every command)
# -l  or --list      (List all applications that will be installed)
# -i  or --install   (Begin install script)

# Install yay AUR helper
# git clone https://aur.archlinux.org/yay.git && cd yay
# makepkg -si

# todo: applications could possibly be put into specific lists for multimedia, tools, internet

# Applications from the official repository
apps_official=(
    # multimedia
    firefox
    audacity
    vlc
    obs-studio
    kden-live
    discord
    steam
    gimp
    mpv
    libreoffice
    blender

    # security
    bitwarden

    # programming
    emacs-wayland
    visual-studio-code-bin
    npm

    # tools
    qpwgraph
    nautilus
    systemdgenie
    gnome-firmware
    kitty
    qbittorrent
    virtualbox

    # window manager
    sway
    swaylock
    swayidle
    swaybg
    waybar
)

# Applications from the AUR (Arch User-Repository)
apps_community=(
    google-earth-pro
    cpu-x
    minecraft-launcher
    plex-media-player
    sway-auto-idle-inhibit
    synology-drive
    teamviewer
    visual-studio-code-bin
)

#read -p "Are you sure you want to proceed? (y/n): " confirmation

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Dotfiles installer (v0.0.1) by Zakariya Oulhadj."
    echo ""
    echo "This is the dotfiles installer which installs Zakariya Oulhadj's \
dotfiles and applications."
    echo ""
    echo "-h/--help: Prints this help menu."
    echo "-nc/--noconfirm: Does not ask user to confirm each command before running."
    echo "-l/--list: Lists all applications to be installed."
    echo "-i/--install: Begins the install script."
fi


# todo: arguments should be able to put in any order.

if [ "$1" == "-nc" ] || [ "$1" == "--noconfirm" ]; then
    echo ""
fi

if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
    echo "${apps_official[@]}"
fi
