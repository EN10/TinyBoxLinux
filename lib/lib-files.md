```
cd initramfs
sudo chroot . /bin/sh
# mkdir proc
# mount -t proc none /proc
ps
sudo strace -ff -p 12345 -o trace
ping -c1 google.com
wget example.com
cat trace.12346 | grep openat | grep -v ENOENT | awk '{print $2}'

"/lib/x86_64-linux-gnu//libnss_nis.so.2",
"/lib/x86_64-linux-gnu//libnsl.so.1",
"/lib/x86_64-linux-gnu//libnss_files.so.2",
"/lib/x86_64-linux-gnu//libc.so.6",
"/lib/x86_64-linux-gnu//ld-linux-x86-64.so.2",
"/etc/services",
"/etc/resolv.conf",
"/lib/x86_64-linux-gnu//libnss_dns.so.2",
"/lib/x86_64-linux-gnu//libresolv.so.2",
"/etc/resolv.conf",
"index.html",

ls -l ./initramfs/lib/x86_64-linux-gnu

ld-linux-x86-64.so.2  
libc.so.6  
libnsl.so.1 -> libnsl-2.31.so
libnss_dns.so.2  
libnss_files.so.2 -> libnss_files-2.31.so
libnss_nis.so.2 -> libnss_nis-2.31.so
libresolv.so.2
```
