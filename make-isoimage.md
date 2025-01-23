``` bash
sudo wget -O ~/initramfs.cpio.gz \
  https://raw.githubusercontent.com/EN10/TinyBoxLinux/main/bootfiles/initramfs.cpio.gz
```

``` bash
curl -sL https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz | tar -xJf - syslinux-6.03/bios/core/isolinux.bin syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 && mkdir -p /usr/lib/syslinux && mv syslinux-6.03/bios/core/isolinux.bin syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 /usr/lib/syslinux/ && rm -rf syslinux-6.03
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