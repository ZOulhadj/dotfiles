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
A general list of the main steps that need to be performed when setting up the
Arch system.

### System Installation/Configuration
- Update system clock ``timedatectl``
- Parition system (EFI, Root, Swapfile)
- Install core system packages ``pacstrap -K /mnt base linux linux-firmware grub efibootmgr amd-ucode sudo networkmanager nano``
- Generate fstab file ``genfstab -U /mnt >> /mnt/etc/fstab``
- Chroot into new system ``arch-chroot /mnt``

- Set timezone ``ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime``
- Run ``hwclock --systohc`` to create ``/etc/adjtime``
- Edit ``/etc/locale.gen`` and uncomment desired locales and then run ``locale-gen``
- Create ``/etc/locale.conf`` and set LANG variable ``LANG=en_GB.UTF-8``
- Set vconsole keymap ``/etc/vconsole.conf`` to ``KEYMAP=uk``
- Create hostname file ``/etc/hostname/`` and set desired system name
- Edit hosts file ``/etc/hosts/``
- Enable sudo for users in the wheel group
- start/enable Network Manager service
- Enable pacman multilib ``/etc/pacman.conf`` (32 bit application repository)
- Enable pacman terminal colors ``/etc/pacman.conf``
- Obtain latest hardware drivers via fwupd
- Configure TLP config for battery thresholds ``/etc/tlp.conf``

- Unmute ALSA channels via alsamixer provided by ``alsa-utils``
- Enable fstrim timer service to automatically trim SSD via ``util-linux``
- Set root password ``passwd``
- Create user accounts, set passwords and add to required groups (wheel)
- Install GRUB bootloaded
- Install CPU microcode

### Post-installation
- Install application
- Clone dotfiles repository
- Create symbolic links for dotfiles

- Initialize Git system config

### Bug fixes
- Add ``amdgpu.dcdebugmask=0x10`` to ``GRUB_CMDLINE_LINUX_DEFAULT`` in
  ``/etc/default/grub`` and then run ``sudo grub-mkconfig -o
  /boot/grub/grub.cfg`` to update grub.

  **Reason**: My laptop is a Thinkpad T14s Gen 3 AMD which crashes after waking
  from sleep. This can be fixed by disabling PSR (Panel Self Refresh). This is a
  regression issue with kernel 5.19 [bug
  report](https://bugs.launchpad.net/ubuntu/+source/linux-hwe-5.19/+bug/2007718)

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


