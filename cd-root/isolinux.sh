# BusyBox Linux iso

# https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX
# cd-root.tar.gz: isolinux/isolinux.bin isolinux/ldlinux.c32 isolinux.cfg
wget https://github.com/EN10/BusyBoxLinux/raw/main/cd-root/cd-root.tar.gz
tar -xvzf cd-root.tar.gz
rm cd-root.tar.gz

cd cd-root
cp ../linux/arch/x86/boot/bzImage .
# rename as init.cpio.gz becomes init.cpi.gz on iso
cp ../init.cpio.gz ./init.gz
# OR use wget
wget https://github.com/EN10/BusyBoxLinux/raw/main/bootfiles/bzImage
wget https://github.com/EN10/BusyBoxLinux/raw/main/bootfiles/init.cpio.gz -O init.gz

sudo apt install mkisofs
cd ..
mkisofs -o BusyBoxLinux.iso \
   -b isolinux/isolinux.bin -c isolinux/boot.cat \
   -no-emul-boot -boot-load-size 4 -boot-info-table \
   cd-root
