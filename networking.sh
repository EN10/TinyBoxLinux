# create busybox initramfs
sudo apt update
sudo apt install git make gcc ncurses-dev bzip2
git clone --depth 1 https://git.busybox.net/busybox
# git pull --depth 1
cd busybox
make menuconfig
# Settings - Build static binary
# https://github.com/EN10/BusyBoxLinux/blob/main/lib/busybox-static.sh
make -j 8
make CONFIG_PREFIX=../initramfs install

# copy glibc libraries for DNS from host machine
# https://wiki.gentoo.org/wiki/Custom_Initramfs#DNS
cd ../initramfs
lib=lib/x86_64-linux-gnu/
mkdir -p ${lib}
cp /${lib}{libnss_dns,libresolv,ld-linux-x86-64}.so.2 /${lib}libc.so.6 ${lib}
# strace: https://github.com/EN10/BusyBoxLinux/blob/main/lib/strace-wget.sh
# OR use APT: https://github.com/EN10/BusyBoxLinux/blob/main/lib/libc6-apt-dns.sh

# setup /etc
cd ../initramfs
mkdir etc
echo 'nameserver 8.8.8.8' > etc/resolv.conf

cd ../initramfs
# /init based on https://wiki.gentoo.org/wiki/Custom_Initramfs#Init
wget https://raw.githubusercontent.com/EN10/BusyBoxLinux/main/bootfiles/init
chmod +x init
rm linuxrc

# create init.cpio.gz
cd ../initramfs
find . | cpio -o -H newc | gzip -9 > ../init.cpio.gz
