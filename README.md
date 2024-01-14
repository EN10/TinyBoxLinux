# BusyBox Linux

Very Small Linux Distro 13.4MB

* Based on: [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg)

* [Linux Kernel](https://www.kernel.org) 6.7.0: `bzImage` 12.3MB
* [BusyBox](https://busybox.net) 1.36.1: `init.cpio` 2.64MB

**Run on [QEMU](https://www.qemu.org):**
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio
```
