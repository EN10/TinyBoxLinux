# MiniLinux

Very Small Linux Distro

* [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg)

* Linux Kernel 6.6.4: `bzImage`
* BusyBox 1.37.0: `init.cpio`

**QEMU:**
```
.\qemu-system-x86_64.exe -kernel bzImage -initrd init.cpio
```
