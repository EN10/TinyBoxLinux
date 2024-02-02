# setup docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker $USER
docker run --privileged -it ubuntu
sudo apt install bzip2 git nano make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools

# Linux Kernel: bzImage
git clone --depth 1 https://github.com/torvalds/linux.git
# git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git -b linux-6.7.y
cd linux
make defconfig
make -j 8
docker cp CONTAINER_ID:/root/linux/arch/x86/boot/bzImage ./

# userspace busybox
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
make menuconfig
# Settings - Build static binary
# https://github.com/EN10/BusyBoxLinux/blob/main/lib/BusyBox-static.sh
make -j 8
make CONFIG_PREFIX=../initramfs install
cd ../initramfs
echo -e '#!/bin/sh\n\n/bin/sh' > init
chmod +x init
rm linuxrc
find . | cpio -o -H newc | gzip -9 > ../init.cpio.gz
