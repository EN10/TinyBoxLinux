```
make tinyconfig
make menuconfig
```
 
* <ins>**G**</ins>eneral setup - <ins>**I**</ins>nitial RAM filesystem and RAM disk - <ins>**S**</ins>upport initial ramdisk/ramfs compressed using gzip
* <ins>**G**</ins>eneral setup - <ins>**C**</ins>onfigure stamdard kernel features - <ins>**E**</ins>nable support for printk  
* <ins>**E**</ins>xecutable file formats -  <ins>**K**</ins>ernel support for ELF binaries
* <ins>**E**</ins>xecutable file formats -  <ins>**K**</ins>ernel support for scripts starting with #!
* N<ins>**e**</ins>tworking support - N<ins>**e**</ins>tworking options - <ins>**P**</ins>acket socket
* N<ins>**e**</ins>tworking support - N<ins>**e**</ins>tworking options - <ins>**T**</ins>CP/IP networking   
* <ins>**D**</ins>evice Drivers - <ins>**C**</ins>haracter devices - <ins>**E**</ins>nable TTY  
* <ins>**D**</ins>evice Drivers - <ins>**P**</ins>CI support
* <ins>**D**</ins>evice Drivers - N<ins>**e**</ins>twork device support - <ins>**E**</ins>thernet driver support - <ins>**I**</ins>ntel devices - **I**ntel(R) PRO/1000 Gigabit Ethernet support  
* <ins>**F**</ins>ile systems - <ins>**p**</ins>seudo filesystems - /proc file system support  
* <ins>**F**</ins>ile systems - <ins>**p**</ins>seudo filesystems - sysfs file system support  

[Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d)

* `TTY` enables Console
* `printk` enables kernel output on boot
*  `initial ramdisk gzip` enables init.cpio.gz
*  `ELF` enables /bin/sh
*  `#! scripts` enables init /bin/sh
*  `sysfs & PCI & Intel PRO/1000` enables eth0
*  `Packet & TCP/IP` enables networking software
*  `/proc` enables ps 
