``` bash
sudo wget -O ~/initramfs.cpio.gz \
  https://raw.githubusercontent.com/EN10/TinyBoxLinux/main/bootfiles/initramfs.cpio.gz
```

``` bash
sudo wget -O /usr/lib/syslinux/isolinux.bin \
  https://raw.githubusercontent.com/EN10/TinyBoxLinux/main/cd-root/isolinux.bin
```

``` bash
make isoimage \
  FDARGS="initrd=/initramfs.cpio.gz" \
  FDINITRD="../initramfs.cpio.gz" \
  ISOLINUX_BIN="/usr/lib/syslinux/isolinux.bin" \
  ARCH=x86_64 \
  CROSS_COMPILE=x86_64-linux-gnu- \
  -j 4
```