```
# Linux Kernel: bzImage
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux
make tinyconfig
# </> for Search
make menuconfig
make -j 8
docker cp CONTAINER_ID:/root/linux/arch/x86/boot/bzImage ./
```

#### Linux/x84_64 6.7.y Kernel Configuration  </> for Search

* <ins>**G**</ins>eneral setup - <ins>**I**</ins>nitial RAM filesystem and RAM disk - <ins>**S**</ins>upport initial ramdisk/ramfs compressed using gzip
* <ins>**G**</ins>eneral setup - <ins>**C**</ins>onfigure stamdard kernel features - <ins>**E**</ins>nable support for printk
* <ins>**G**</ins>eneral setup - <ins>**C**</ins>onfigure stamdard kernel features - <ins>**E**</ins>nable futex support 
* <ins>**E**</ins>xecutable file formats -  <ins>**K**</ins>ernel support for ELF binaries
* <ins>**E**</ins>xecutable file formats -  <ins>**K**</ins>ernel support for scripts starting with #!
* N<ins>**e**</ins>tworking support - N<ins>**e**</ins>tworking options - <ins>**U**</ins>nix domain sockets 
* N<ins>**e**</ins>tworking support - N<ins>**e**</ins>tworking options - <ins>**T**</ins>CP/IP networking
* <ins>**D**</ins>evice Drivers - <ins>**P**</ins>CI support 
* <ins>**D**</ins>evice Drivers - <ins>**G**</ins>enric Driver Options - M**a**intain a devtmpfs filesystem to mount at /dev - **A**utomount devtmpfs at /dev, after the kernel mounted the rootfs
* <ins>**D**</ins>evice Drivers - <ins>**C**</ins>haracter devices - <ins>**E**</ins>nable TTY  
* <ins>**D**</ins>evice Drivers - N<ins>**e**</ins>twork device support - <ins>**E**</ins>thernet driver support - <ins>**I**</ins>ntel devices - **I**ntel(R) PRO/1000 Gigabit Ethernet support  
* <ins>**F**</ins>ile systems - <ins>**p**</ins>seudo filesystems - /proc file system support  
* <ins>**F**</ins>ile systems - <ins>**p**</ins>seudo filesystems - sysfs file system support  

Based on [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d)

* `TTY` enables Console
* `printk` enables kernel output on boot
*  `futex` required by elinks
*  `initial ramdisk gzip` enables init.cpio.gz
*  `ELF` enables /bin/sh
*  `#! scripts` enables init with /bin/sh
*  `Intel PRO/1000 & PCI` drivers for e1000 (default QEMU network device) through the PCI bus
*  `sysfs` makes eth0 visable in /sys
*  `Unix Socket & TCP/IP` enables networking software
*  `/proc` enables ps
