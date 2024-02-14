# use APT to install glibc libraries for DNS
mkdir pkg && cd pkg
sudo apt install apt-rdepends
apt-rdepends libc6 | awk '{ print $1 }' | sort | uniq | tr '\n' ' ' | cut -d " " -f3- > deps.txt
apt download $(cat deps.txt)
mkdir -p ../var/lib/dpkg/updates ../var/lib/dpkg/info && touch ../var/lib/dpkg/status
sudo dpkg --root ../ -i * 
# debug dpkg
# sudo dpkg --root ../ --configure -a 


# deps.txt :
# libc6 libcrypt1 libgcc-s1 
# https://packages.ubuntu.com/focal/libc6
