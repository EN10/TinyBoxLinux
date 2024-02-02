# BusyBox Linux

Tiny BusyBox Linux Distro from 5.12MB

### Based on:

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)
* [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d) - [menuconfig](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md) 
* [Networking from Gentoo Wiki](https://wiki.gentoo.org/wiki/Custom_Initramfs#Networking) - [networking.sh](https://github.com/EN10/BusyBoxLinux/blob/main/networking.sh) - [find /lib deps](https://github.com/EN10/BusyBoxLinux/blob/main/lib/lib-files.sh)    
* [Make a Bootable CD With ISOLINUX](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX) - [isolinux.sh](https://github.com/EN10/BusyBoxLinux/blob/main/cd-root/isolinux.sh)

### Distro Files:

The BusyBox Linux Distro has 2 main files in `bootfiles`:

* [Linux Kernel](https://www.kernel.org) 6.7.0: `bzImage` [2.63MB](https://github.com/EN10/BusyBoxLinux/blob/main/bootfiles/bzImage) (tinyconfig + networking)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` [2.49MB](https://github.com/EN10/BusyBoxLinux/blob/main/bootfiles/init.cpio.gz) (with networking)

### Run on [QEMU](https://www.qemu.org):
from `BusyBoxLinux.iso`
```
.\qemu-system-x86_64.exe -cdrom BusyBoxLinux.iso
```
from `bzImage` and `init.cpio.gz`
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz
```
Specify cores `-smp` and memory `-m`
```
.\qemu-system-x86_64.exe -cdrom BusyBoxLinux.iso -smp 1 -m 512
```
### Simple Distro Setup
* [Build defconfig Kernel & Busybox](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)    
`defconfig bzImage 12.8MB`
### Add Networking:
* [Build BusyBox with Networking](https://github.com/EN10/BusyBoxLinux/blob/main/networking.sh) - [Identify /lib dependencies](https://github.com/EN10/BusyBoxLinux/blob/main/lib/lib-files.sh)    
`BusyBox init.cpio.gz 2.49MB`
* [Build tinyconfig Kernel with Networking](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md)    
`tinyconfig bzImage 2.63MB`
### Create bootable CD iso
* [isolinux setup](https://github.com/EN10/BusyBoxLinux/blob/main/cd-root/isolinux.sh) - [BusyboxLinux.iso](https://github.com/EN10/BusyBoxLinux/blob/main/cd-root/BusyBoxLinux.iso)    
`BusyBoxLinux.iso 5.62 MB`
