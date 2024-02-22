#!/bin/bash

# Script to install the base Arch linux system.

# Simple Arch Linux Installation Script
# Script assumes that you are running the live arch environment and connected to
# the internet

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# hostname=arch
# keymap=uk
# lang=en_GB.UTF-8

read -p "Enter hostname: (e.g., arch): " hostname
read -p "Enter keyboard keymap: (e.g., uk): " hostname


# Update system clock
# timedatectl

# Partition and make filesystems (EFI, Root, Swapfile)
lsblk
read -p "Enter drive for installation: (e.g., /dev/sda): " drive
# fdisk /dev/sda << EOF
# g                # create new empty GPT partition table

# Create EFI System partition
# n                # add a new partition
# 1                # select first partition
# insert enter key # confirm default partition offset (2048)
# +512M            # set partition size
# t                # set partition type
# 1                # set partition type to EFI System

# Create Linux filesystem partition
# n                # add a new partition
# 2                # select second partition
# insert enter key # confirm partition number
# insert enter key # confirm default partition offset
# insert enter key # confirm default partition size (remaining size)
# t                # set partition type
# 2                # set partition number
# 20               # set partition type to Linux filesystem

# Write partition table to selected disk
# w
# EOF

# Format partitions
# mkfs.fat -F 32 /dev/sda1
# mkfs.ext4 /dev/sda2

# Mount the root partition
# mount /dev/sda2 /mnt

# create EFI mount point and mount partition
# mount --mkdir /dev/sda1 /mnt/boot

# Create swapfile
# dd if=/dev/zero of=/mnt/swapfile bs=1M count=8k status=progress (8GB)
# chmod 0600 /mnt/swapfile
# mkswap -U clear /mnt/swapfile
# swapon /mnt/swapfile

# Install base system
# pacstrap -K /mnt <core applications>

# Generate fstab
# genfstab -U /mnt >> /mnt/etc/fstab



# Change root into the new system
# arch-chroot /mnt


# # Install and configure bootloader (GRUB)
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg

# Set timezone
# ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
# hwclock --systohc

# Set locale
# echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
# locale-gen
# echo "LANG=en_US.UTF-8" > /etc/locale.conf
# echo "KEYMAP=uk" > /etc/vconsole.conf

# Set hostname
# echo $hostname > /etc/hostname

# # Set hosts file
# echo "127.0.0.1     localhost" >> /etc/hosts
# echo "::1           localhost" >> /etc/hosts
# echo "127.0.1.1     $hostname.localdomain $hostname" >> /etc/hosts

# Create symbolic link for Network Manager so it starts at boot
# systemctl enable NetworkManager

# Set root password
# passwd

# Perform post install stuff (users, pacman multilib and colors, TLP, SSD trim, unmute audio)

# # Exit chroot
# exit

# echo "Installation complete. You can now reboot the system."
# Sleep for 10 seconds so user can read message that installation is complete

# reboot






########################################
# Temp notes

# - Update system clock ``timedatectl``
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
# - Set NTP ``timedatectl set-ntp true``
# - Set root password ``passwd``
# - Create user accounts, set passwords and add to required groups
#   ``useradd -m -G wheel -s /usr/bin/zsh zakariya``
#   ``passwd zakariya``
# - Install GRUB bootloader
# - Install CPU microcode ``pacman -S amd-ucode``
#   Installing this package should automatically call grub-mkconfig so that the
#   microcode gets loaded at boot.
# - Hibernation (Not complete)
#   Add the ``resume`` hook to ``/etc/mkinitcpio.conf`` like in the below example and regnerate initramfs like so ``sudo mkinitcpio -P``:
#   HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block filesystems resume fsck)

# Bugs

# - Disable PSR (Panel Self Refresh)
#   Add ``amdgpu.dcdebugmask=0x10`` to ``GRUB_CMDLINE_LINUX_DEFAULT`` in
#   ``/etc/default/grub`` and then run ``sudo grub-mkconfig -o /boot/grub/grub.cfg`` to update grub.

#   **Reason**: My laptop is a Thinkpad T14s Gen 3 AMD which crashes after waking
#   from sleep. This can be fixed by disabling PSR (Panel Self Refresh). This is a
#   regression issue with kernel 5.19 [bug
#   report](https://bugs.launchpad.net/ubuntu/+source/linux-hwe-5.19/+bug/2007718)

#   ---- My current kernel version is 6.7.4 so not sure if this has already been fixed
#   but will need to test. ----
#
#
# This does not seem to have fixed the issue. I am getting regular crashing
# issues which might be something to do with CPU voltages and scaling. There
# seems to be a MCE error that I keep getting. Need to find a solution asap.
# Below is typically the error I get when running ``journalctl -b``:
#
# Feb 22 06:49:34 arch kernel: mce: [Hardware Error]: Machine check events logged
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Corrected error, no action required.
# Feb 22 06:49:34 arch kernel: [Hardware Error]: CPU:0 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400002000175
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Error Addr: 0x000000010028d99c
# Feb 22 06:49:34 arch kernel: [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000291a1f2601
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Load Store Unit Ext. Error Code: 0, An ECC error was detected on a data cache read by a p>
# Feb 22 06:49:34 arch kernel: [Hardware Error]: cache level: L1, tx: DATA, mem-tx: EV
# Feb 22 06:49:34 arch kernel: mce: [Hardware Error]: Machine check events logged
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Corrected error, no action required.
# Feb 22 06:49:34 arch kernel: [Hardware Error]: CPU:1 (19:44:1) MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0xdc20400001010135
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Error Addr: 0x000000016c71b55c
# Feb 22 06:49:34 arch kernel: [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000291a1f1507
# Feb 22 06:49:34 arch kernel: [Hardware Error]: Load Store Unit Ext. Error Code: 1, An ECC error or L2 poison was detected on a data cach>
# Feb 22 06:49:34 arch kernel: [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
