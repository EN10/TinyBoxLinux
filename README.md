# TinyBox Linux

TinyBox Linux Distro ~ 3 MB (Kernel + ToyBox initramfs)

### Based on:

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/TinyBoxLinux/blob/main/setup.sh) - [crosscompile.sh](https://github.com/EN10/TinyBoxLinux/blob/main/CROSS_COMPILE.sh)
* [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel) - [menuconfig](https://github.com/EN10/TinyBoxLinux/blob/main/tinymenuconfig.md) 
* [Networking from Gentoo Wiki](https://wiki.gentoo.org/wiki/Custom_Initramfs#Networking) - [networking.sh](https://github.com/EN10/TinyBoxLinux/blob/main/networking.sh) - [find Wget deps](https://github.com/EN10/TinyBoxLinux/blob/main/lib/wget/wget-libs.sh)    
* [Find Library Dependencies](https://unix.stackexchange.com/questions/120015/how-to-find-out-the-dynamic-libraries-executables-loads-when-run) - [Wget, strace & Elinks](https://github.com/EN10/TinyBoxLinux/tree/main/lib)  
* [Make a Bootable CD With ISOLINUX](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX) - [make isoimage](https://github.com/EN10/TinyBoxLinux/blob/main/make-isoimage.md)

### Distro Files:

The TinyBox Linux Distro iso in `cd-root`:  
* `image.iso` [3.56 MB](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/image.iso)  (Linux 6.12.101 & ToyBox 0.8.12)

The BusyBox Linux Distro has 2 (BusyBox OR ToyBox) main files in `bootfiles`:

* [Linux Kernel](https://www.kernel.org) 6.17.91: `bzImage` [2.65 MB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/bzImage) (tinyconfig + networking)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` [2.34 MB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/init.cpio.gz) (with networking)
* [ToyBox](https://landley.net/toybox) 0.8.13 `initramfs.cpio.gz` [500 KB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/initramfs.cpio.gz) - [latest precompiled](https://landley.net/bin/mkroot)


### QEMU Setup for Windows
* [QEMU Prebuilt Zip](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/qemu-extracted.zip) [38.5 MB] - concise version of the installer [172 MB]

Exe files can be downloaded from here: https://qemu.weilnetz.de/w64/

To recreate the zip using a downloaded installer:
```bash
./extract_qemu.sh qemu-w64-setup-20250826.exe
```

### Run on [QEMU](https://www.qemu.org):
from `image.iso`
```
.\qemu-system-x86_64.exe -cdrom image.iso
```
from `bzImage` and `init.cpio.gz`
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz
```
Specify cores `-smp` and memory `-m`
```
.\qemu-system-x86_64.exe -cdrom image.iso -smp 1 -m 512
```
Windows Terminal
```
.\qemu-system-x86_64 -kernel .\bzImage -initrd initramfs.cpio.gz -no-reboot -nographic -append "console=ttyS0"
```
### Update on aarch64

```
git clone -b linux-6.99.y --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
wget https://raw.githubusercontent.com/EN10/TinyBoxLinux/refs/heads/main/bootfiles/.config
time yes "" | make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 4
```


### Simple Distro Setup
* [Build defconfig Kernel & Busybox](https://github.com/EN10/TinyBoxLinux/blob/main/setup.sh)    
`defconfig bzImage 12.8MB`
### Add Networking:
* [Build BusyBox with Networking](https://github.com/EN10/TinyBoxLinux/blob/main/networking.sh) - [Identify Wget dependencies](https://github.com/EN10/TinyBoxLinux/blob/main/lib/wget/wget-libs.sh)    
`BusyBox init.cpio.gz 2.34 MB`
* [Build tinyconfig Kernel with Networking](https://github.com/EN10/TinyBoxLinux/blob/main/tinymenuconfig.md)    
`tinyconfig bzImage 2.65 MB`
* [Install Elinks browser](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/install-elinks.sh) - [Identify Elinks dependencies](https://github.com/EN10/TinyBoxLinux/blob/main/lib/elinks/elinks.sh)  
`./install-elinks.sh`
### Create bootable CD iso
* [isolinux setup](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/isolinux.sh) - [BusyboxLinux.iso](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/BusyBoxLinux.iso) [TinyboxLinux.iso](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/TinyBoxLinux.iso)    
`BusyBoxLinux.iso 5.45 MB`    `TinyBoxLinux.iso 3.61 MB`
