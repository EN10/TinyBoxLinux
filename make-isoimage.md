``` bash
curl -sL https://landley.net/bin/mkroot/0.8.12/x86_64.tgz | \
  tar -xz -C ~ -f - --strip-components=1 x86_64/initramfs.cpio.gz
```

``` bash
curl -sL https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz | \
  tar -xJf - \
    syslinux-6.03/bios/core/isolinux.bin \
    syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 && \
  sudo mkdir -p /usr/lib/syslinux && \
  sudo mv \
    syslinux-6.03/bios/core/isolinux.bin \
    syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 \
    /usr/lib/syslinux/ && \
  rm -rf syslinux-6.03
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