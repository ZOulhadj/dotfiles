# Script to install the base Arch linux system.

# - Update system clock ``timedatectl``
# - Parition system (EFI, Root, Swapfile)
# - Install core packages [1](./applications.md#core) ``pacstrap -K /mnt base linux linux-firmware grub efibootmgr sudo networkmanager nano``
# - Generate fstab file ``genfstab -U /mnt >> /mnt/etc/fstab``
# - Chroot into new system ``arch-chroot /mnt``
# - Set timezone ``ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime``
# - Run ``hwclock --systohc`` to create ``/etc/adjtime``
# - Edit ``/etc/locale.gen`` and uncomment desired locales and then run ``locale-gen``
# - Create ``/etc/locale.conf`` and set LANG variable ``LANG=en_GB.UTF-8``
# - Set vconsole keymap ``/etc/vconsole.conf`` to ``KEYMAP=uk``
# - Create hostname file ``/etc/hostname/`` and set desired system name
# - Edit hosts file ``/etc/hosts/``
# - Enable sudo for users in the wheel group ``EDITOR=nano visudo``
# - start/enable Network Manager systemctl service
# - Enable pacman multilib ``/etc/pacman.conf`` (32 bit application repository)
# - Enable pacman terminal colors ``/etc/pacman.conf``
# - Install utility packages [2](./applications.md#utilities)
# - Obtain latest hardware drivers via fwupd
# - Configure TLP config for battery thresholds ``/etc/tlp.conf``
# - Unmute ALSA channels via alsamixer provided by ``alsa-utils``
# - Enable fstrim timer service to automatically trim SSD via ``util-linux``
# - Set root password ``passwd``
# - Create user accounts, set passwords and add to required groups
#   ``useradd -m -G wheel -s /usr/bin/zsh zakariya``
#   ``passwd zakariya``
# - Install GRUB bootloader
# - Install CPU microcode ``pacman -S amd-ucode`` 
#   Installing this package should automatically call grub-mkconfig so that the
#   microcode gets loaded at boot.

# - Disable PSR (Panel Self Refresh)
#   Add ``amdgpu.dcdebugmask=0x10`` to ``GRUB_CMDLINE_LINUX_DEFAULT`` in
#   ``/etc/default/grub`` and then run ``sudo grub-mkconfig -o /boot/grub/grub.cfg`` to update grub.

#   **Reason**: My laptop is a Thinkpad T14s Gen 3 AMD which crashes after waking
#   from sleep. This can be fixed by disabling PSR (Panel Self Refresh). This is a
#   regression issue with kernel 5.19 [bug
#   report](https://bugs.launchpad.net/ubuntu/+source/linux-hwe-5.19/+bug/2007718)

#   My current kernel version is 6.7.4 so not sure if this has already been fixed
#   but will need to test.
