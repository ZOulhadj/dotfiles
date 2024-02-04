# Dotfiles

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
All packages that I install can be found in ``applications.txt``.

## Setup

### System-wide configuration
- Enable sudo for users in the wheel group
- start/enable Network Manager service
- Enable pacman multilib ``/etc/pacman.conf`` (32 bit application repository)
- Enable pacman terminal colors ``/etc/pacman.conf``
- Obtain latest hardware drivers via fwupd
- Configure TLP config for battery thresholds ``/etc/tlp.conf``
- Create user accounts and add to required groups (wheel)

### User configuration
- Initialize Git system config

# Useful commands

- List explicity installed packages from the official repository ``pacman -Qe``
- List explicity installed packages from both official and AUR repository ``yay -Qe``

# Tasks
- [ ] Linux Arch base install script
- [ ] Package install script
- [ ] Package configuration script
- [X] User dotfiles

- [ ] Prebuilt ISO via archiso

One of my goals is to package everything into a prebuilt Arch ISO
file. This would allow me to install the system with everything preconfigured.


