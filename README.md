# BusyBox Linux

Very Small Linux Distro 9.36MB

* Based on: [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)
* Based on: [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d) - [menuconfig](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md) - [tiny.config](https://github.com/EN10/BusyBoxLinux/blob/main/tiny.config)
* Based on: [Networking from MSMD Linux](https://github.com/maksimKorzh/msmd-linux/releases/tag/0.1) - [networking.sh](https://github.com/EN10/BusyBoxLinux/blob/main/networking.sh)

* [Linux Kernel](https://www.kernel.org) 6.7.0: `bzImage` 2.63MB (tiny + Networking)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` 6.73MB (with networking)

**Run on [QEMU](https://www.qemu.org):**
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz
```
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz -smp 1 -m 512
```
