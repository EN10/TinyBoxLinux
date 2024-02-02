# use APT to install glibc libraries for DNS
mkdir ../pkg && cd ../pkg
sudo apt install apt-rdepends
apt-rdepends libc6 | awk '{ print $1 }' | sort | uniq | tr '\n' ' ' | cut -d " " -f3- > deps.txt
apt download $(cat deps.txt)
mkdir -p ../initramfs//var/lib/dpkg/updates ../initramfs//var/lib/dpkg/info && touch ../initramfs//var/lib/dpkg/status
sudo dpkg --root ../initramfs/ -i * 
# debug dpkg
# sudo dpkg --root ../init/ --configure -a 
