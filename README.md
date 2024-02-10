# Dotfiles

**This repository is work in progress and is not guaranteed to work.**

The goal of this repository is for me to be able to have a custom, efficient and
reproducible system that can be easily installed.

These are my Linux Arch dotfiles managed by [GNU
Stow](https://www.gnu.org/software/stow/). The dotfiles can located anywhere in
your home folder but I prefer to put everything into a ``~/.dotfiles``
folder. Call ``make`` inside the folder which will automatically generate
symbolic links from the dotfiles folder to your home folder. The advantage of
this is that it allows for all the dotfiles to be located within the same folder
under version control whilst still allowing a system to find the various
configurations. To undo all the symbolic links, run ``make delete``.

## Software
All packages that I install can be found in ``applications.md``.

## Installing
1. ``install-system.sh`` - Installs the base Linux Arch system
2. ``install-user.sh`` - Installs dotfiles and applications.

# Useful commands
- Packages installed from all repositories ``pacman -Qe``
- Packages installed from AUR repository ``pacman -Qem``

# Tasks
- [ ] Linux Arch base install script
- [ ] Package install script
- [ ] Package configuration script
- [X] User dotfiles
- [ ] Prebuilt ISO via [archiso](https://wiki.archlinux.org/title/Archiso)

One of my goals is to package everything into a prebuilt Arch ISO
file. This would allow me to install the system with everything preconfigured.


