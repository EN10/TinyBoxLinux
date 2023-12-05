# MiniLinux

Very Small Linux Distro

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg)

* Linux Kernel: `bzImage`
* BusyBox: `init.cpio`

**QEMU:**
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio
```
