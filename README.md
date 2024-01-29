# BusyBox Linux

Tiny Linux Distro 5.18MB

### Based on:

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)
* [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d) - [menuconfig](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md) - [tiny.config](https://github.com/EN10/BusyBoxLinux/blob/main/tiny.config)
* [Networking from MSMD Linux](https://github.com/maksimKorzh/msmd-linux/releases/tag/0.1) - [networking.sh](https://github.com/EN10/BusyBoxLinux/blob/main/networking.sh)

### Distro Files:

The BusyBox Linux Distro has 2 main files in `bootfiles`:

* [Linux Kernel](https://www.kernel.org) 6.7.0: `bzImage` [2.63MB](https://github.com/EN10/BusyBoxLinux/blob/main/bootfiles/bzImage) (tinyconfig + networking)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` [2.55MB](https://github.com/EN10/BusyBoxLinux/blob/main/bootfiles/init.cpio.gz) (with networking)

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
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz -smp 1 -m 512
```
### Simple Distro Setup
* [Build defconfig Kernel & Busybox](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)    
`defconfig bzImage 12.8MB`
### Add Networking:
* [BusyBox Networking](https://github.com/EN10/BusyBoxLinux/blob/main/networking.sh)
* [Build tinyconfig Kernel with Networking](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md)    
`tinyconfig bzImage 2.63MB`
### Create iso
* [isolinux setup.md](https://github.com/EN10/BusyBoxLinux/blob/main/cd-root/isolinux.md) - [BusyboxLinux.iso](https://github.com/EN10/BusyBoxLinux/blob/main/cd-root/BusyBoxLinux.iso)    
`BusyBoxLinux.iso 5.69 MB`
