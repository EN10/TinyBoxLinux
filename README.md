# TinyBox Linux

TinyBox Linux Distro ~ 3 MB (Kernel + ToyBox initramfs)

### Based on:

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/TinyBoxLinux/blob/main/setup.sh) - [crosscompile.sh](https://github.com/EN10/TinyBoxLinux/blob/main/CROSS_COMPILE.sh)
* [Building a tiny Linux kernel](https://web.archive.org/web/20220106191229/https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d) - [menuconfig](https://github.com/EN10/TinyBoxLinux/blob/main/tinymenuconfig.md) 
* [Networking from Gentoo Wiki](https://wiki.gentoo.org/wiki/Custom_Initramfs#Networking) - [networking.sh](https://github.com/EN10/TinyBoxLinux/blob/main/networking.sh) - [find Wget deps](https://github.com/EN10/TinyBoxLinux/blob/main/lib/wget/wget-libs.sh)    
* [Find Library Dependencies](https://unix.stackexchange.com/questions/120015/how-to-find-out-the-dynamic-libraries-executables-loads-when-run) - [Wget, strace & Elinks](https://github.com/EN10/TinyBoxLinux/tree/main/lib)  
* [Make a Bootable CD With ISOLINUX](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX) - [isolinux.sh](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/isolinux.sh)

### Distro Files:

The TinyBox Linux Distro iso in `cd-root`:  
* [TinyBoxLinux.iso 3.61 MB](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/TinyBoxLinux.iso)  

The BusyBox Linux Distro has 2 (BusyBox OR ToyBox) main files in `bootfiles`:

* [Linux Kernel](https://www.kernel.org) 6.10.2: `bzImage` [2.74 MB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/bzImage) (tinyconfig + networking)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` [2.34 MB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/init.cpio.gz) (with networking)
* [ToyBox](https://landley.net/toybox) 0.8.11 `initramfs.cpio.gz` [526 KB](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/initramfs.cpio.gz)


### Run on [QEMU](https://www.qemu.org):
from `TinyBoxLinux.iso`
```
.\qemu-system-x86_64.exe -cdrom TinyBoxLinux.iso
```
from `bzImage` and `init.cpio.gz`
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz
```
Specify cores `-smp` and memory `-m`
```
.\qemu-system-x86_64.exe -cdrom TinyBoxLinux.iso -smp 1 -m 512
```
Windows Terminal
```
.\qemu-system-x86_64 -kernel .\bzImage -initrd initramfs.cpio.gz -no-reboot -nographic -append "console=ttyS0"
```
### Simple Distro Setup
* [Build defconfig Kernel & Busybox](https://github.com/EN10/TinyBoxLinux/blob/main/setup.sh)    
`defconfig bzImage 12.8MB`
### Add Networking:
* [Build BusyBox with Networking](https://github.com/EN10/TinyBoxLinux/blob/main/networking.sh) - [Identify Wget dependencies](https://github.com/EN10/TinyBoxLinux/blob/main/lib/wget/wget-libs.sh)    
`BusyBox init.cpio.gz 2.34 MB`
* [Build tinyconfig Kernel with Networking](https://github.com/EN10/TinyBoxLinux/blob/main/tinymenuconfig.md)    
`tinyconfig bzImage 2.68 MB`
* [Install Elinks browser](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/install-elinks.sh) - [Identify Elinks dependencies](https://github.com/EN10/TinyBoxLinux/blob/main/lib/elinks/elinks.sh)  
`./install-elinks.sh`
### Create bootable CD iso
* [isolinux setup](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/isolinux.sh) - [BusyboxLinux.iso](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/BusyBoxLinux.iso) [TinyboxLinux.iso](https://github.com/EN10/TinyBoxLinux/blob/main/cd-root/TinyBoxLinux.iso)    
`BusyBoxLinux.iso 5.45 MB`    `TinyBoxLinux.iso 3.61 MB`
