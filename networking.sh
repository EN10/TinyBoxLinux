# create busybox initramfs
sudo apt update
sudo apt install git make gcc ncurses-dev bzip2
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
# git pull --depth 1
make menuconfig
# Settings - Build static binary
make -j 8
make CONFIG_PREFIX=../initramfs install

# install libc for libnss_dns - needed for networking
mkdir ../pkg
cd ../pkg
sudo apt install apt-rdepends
apt-rdepends libc6 | awk '{ print $1 }' | sort | uniq | tr '\n' ' ' | cut -d " " -f3- > deps.txt
apt download $(cat deps.txt)

mkdir -p ../initramfs//var/lib/dpkg/updates ../initramfs//var/lib/dpkg/info  && touch ../initramfs//var/lib/dpkg/status
sudo dpkg --root ../initramfs/ -i * 
# debug dpkg
# sudo dpkg --root ../init/ --configure -a 

# setup /etc
cd ../initramfs/etc
# /etc/network.sh from https://github.com/maksimKorzh/msmd-linux/releases/download/0.1/root.zip
wget https://raw.githubusercontent.com/EN10/BusyBoxLinux/main/etc/network.sh
# protocols services from https://www.linuxfromscratch.org/lfs/view/stable/chapter08/iana-etc.html
wget https://raw.githubusercontent.com/EN10/BusyBoxLinux/main/etc/protocols
wget https://raw.githubusercontent.com/EN10/BusyBoxLinux/main/etc/services
echo 'nameserver 8.8.8.8' > resolv.conf
chmod +x network.sh 

cd ../initramfs
# /init & /sbin/ethernet based on https://github.com/maksimKorzh/msmd-linux/releases/download/0.1/root.zip
wget https://raw.githubusercontent.com/EN10/BusyBoxLinux/main/init
chmod +x init
rm linuxrc

# test / debug
# cd ./initramfs
# sudo chroot . /bin/sh
# ping -c1 google.com
# wget example.com
# mkdir proc && mount -t proc none /proc
# ps
# sudo strace -ff -p 44192 -o trace
# cat trace.22731 | grep openat

# create init.cpio.gz
sudo su
find . | cpio -o -H newc > ../init.cpio
cat ../init.cpio | gzip -9 > ../init.cpio.gz
exit
