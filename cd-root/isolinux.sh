# BusyBox Linux iso

# https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX
wget https://github.com/EN10/BusyBoxLinux/raw/main/cd-root/cd-root.tar.gz
tar -xvzf cd-root.tar.gz
rm cd-root.tar.gz

cd cd-root
cp ../linux/arch/x86/boot/bzImage .
# rename as init.cpio.gz becomes init.cpi.gz on iso
cp ../init.cpio.gz ./init.gz

sudo apt install mkisofs
mkisofs -o BusyBoxLinux.iso \
   -b isolinux/isolinux.bin -c isolinux/boot.cat \
   -no-emul-boot -boot-load-size 4 -boot-info-table \
   cd-root
