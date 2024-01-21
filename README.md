# BusyBox Linux

Very Small Linux Distro 8.22MB

* Based on: [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/BusyBoxLinux/blob/main/setup.sh)
* Based on: [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d) - [menuconfig](https://github.com/EN10/BusyBoxLinux/blob/main/tinymenuconfig.md) - [.config](https://github.com/EN10/BusyBoxLinux/blob/main/config)

* [Linux Kernel](https://www.kernel.org) 6.7.0: `bzImage` 1.49MB (tiny+)
* [BusyBox](https://busybox.net) 1.37.0: `init.cpio.gz` 6.73MB (with networking)

**Run on [QEMU](https://www.qemu.org):**
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz
```
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio.gz -smp 1 -m 512
```
