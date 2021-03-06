#!/bin/sh

#### INSTALL WILL'S LINUX FROM SCRATCH ####

### ONLY RUN ON NEW MACHINE ###
## Attempts to partition sda1, sda2
## Attempts to install GRUB as current boot loader (MBR)

# Partition Disk
# n       # Create new partition
# p
# 1
# 
# +6G
# n       # Create swap partition
# p
# 2
# 
# 
# t       # Change second partition to swap
# 2
# 82
# a       # Make partition bootable
# 1
# w       # Write changes
echo -e "n\np\n1\n\n+6G\nn\np\n2\n\n\nt\n2\n82\na\n1\nw" | fdisk /dev/sda

# Format Partitions
mkfs.ext4 /dev/sda1
mkswap /dev/sda2

# Mount Partitions
mkdir -p /mnt/localdisk
mount -t ext4 /dev/sda1 /mnt/localdisk
swapon /dev/sda2

# Fetch WLFS
wget https://github.com/willmarkley/wlfs/releases/download/v1.0/wlfs-1.0.tar.gz

# Extract WLFS onto disk
tar -xzf wlfs-1.0.tar.gz -C /mnt/localdisk

## Bootloader Setup
# Mount Virtual Filesystems
mount -v --bind /dev /mnt/localdisk/dev
mount -vt devpts devpts /mnt/localdisk/dev/pts -o gid=5,mode=620
mount -vt proc proc /mnt/localdisk/proc
mount -vt sysfs sysfs /mnt/localdisk/sys
mount -vt tmpfs tmpfs /mnt/localdisk/run

# Install GRUB
(
echo "grub-install /dev/sda"
echo ""
echo "cat > /boot/grub/grub.cfg << \"EOF\" "
echo "# Begin /boot/grub/grub.cfg"
echo "set default=0"
echo "set timeout=5"
echo ""
echo "set root=(hd0,1)"
echo ""
echo "menuentry \"GNU/Linux, Linux 4.11.5-wlfs-1.0\" {"
echo "        linux   /boot/vmlinuz-4.11.5-lfs-SVN-20170325 root=/dev/sda1 ro"
echo "}"
echo "EOF"
echo ""
echo "logout"
) | chroot /mnt/localdisk /usr/bin/env -i              \
    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin     \
    /bin/bash --login



# Unmount Virtual Filesystems
umount -v /mnt/localdisk/dev/pts
umount -v /mnt/localdisk/dev
umount -v /mnt/localdisk/run
umount -v /mnt/localdisk/proc
umount -v /mnt/localdisk/sys
umount -v /mnt/localdisk

# Power off machine
poweroff


