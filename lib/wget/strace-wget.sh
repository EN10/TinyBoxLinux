# apt install libc6
# https://github.com/EN10/BusyBoxLinux/blob/main/lib/wget/apt-libc6.sh

cd initramfs
sudo chroot . /bin/sh
# mkdir proc
# mount -t proc none /proc
ps
sudo strace -ff -p 12345 -o trace
ping -c1 google.com
wget example.com
cat trace.33459 | grep openat | grep -v ENOENT | awk '{print $2}'
# https://github.com/EN10/BusyBoxLinux/blob/main/lib/wget/trace.33459

"/etc/resolv.conf",
"/lib/x86_64-linux-gnu//libnss_dns.so.2",
"/lib/x86_64-linux-gnu//libresolv.so.2",
"/lib/x86_64-linux-gnu//libc.so.6",
"/lib/x86_64-linux-gnu//ld-linux-x86-64.so.2",
"/etc/resolv.conf",
"index.html",

ls -l lib/x86_64-linux-gnu | awk '{print $9}'

ld-linux-x86-64.so.2
libc.so.6
libnss_dns.so.2
libnss_files.so.2
libresolv.so.2

# create lib-dns.tar.gz
# https://github.com/EN10/BusyBoxLinux/blob/main/lib/wget/lib-dns.tar.gz
tar -czvf lib-dns.tar.gz lib/
