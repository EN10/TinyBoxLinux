# BusyBox Dynamic
$ sudo chroot . bin/sh
chroot: failed to run command ‘bin/sh’: No such file or directory
$ ls
bin  sbin  usr
$ ldd bin/sh
        linux-vdso.so.1 (0x00007fff47304000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f6c8a248000)
        libresolv.so.2 => /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f6c8a22c000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6c8a03a000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f6c8a4ae000)
# no /lib in ./initramfs linking to host system

# BusyBox Static
$ ldd bin/sh
        not a dynamic executable
$ sudo chroot . bin/sh
/ # 
