# ToyBox Linux

* [toybox](https://landley.net/toybox)
* [toybox system image](https://landley.net/toybox/downloads/binaries/mkroot/latest/x86_64.tgz)

extract `initramfs.cpio.gz` from `x86_64.tgz\x86_64.tar\x86_64\`

Windows Terminal  
`.\qemu-system-x86_64 -nographic -no-reboot -kernel .\bzImage -initrd initramfs.cpio.gz -append "console=ttyS0"`
