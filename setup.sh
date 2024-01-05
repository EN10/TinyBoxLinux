docker run --privileged -it ubuntu
sudo apt install bzip2 git nano make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools

# Linux Kernel: bzImage
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux
make menuconfig
make -j 8
cp arch/x86_64/boot/bzImage ~/

# userspace busybox
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
make menuconfig
# Settings - Build static binary
make -j 8
make CONFIG_PREFIX=~/initramfs install
# make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 8 CONFIG_PREFIX=~/initramfs install
cd ~/initramfs
printf "#\!/bin/sh\n\n/bin/sh\n" > init
nano init
# see init file
rm linuxrc
chmod +x init
find . | cpio -o -H newc > ../init.cpio

# bootloader
cd ..
sudo apt install syslinux
dd if=/dev/zero of=boot bs=1M count=20
sudo apt install dosfstools
mkfs -t fat boot
syslinux boot
mkdir m
sudo mount boot m
sudo cp bzImage init.cpio m
sudo umount m
