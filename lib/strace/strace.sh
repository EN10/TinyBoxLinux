sudo apt install strace

# path
which strace
/usr/bin/strace

# shared libraries
ldd /usr/bin/strace | awk '{print $3}' | sort > libs.txt
/lib/x86_64-linux-gnu/librt.so.1
/lib/x86_64-linux-gnu/libunwind-ptrace.so.0
/lib/x86_64-linux-gnu/libunwind-x86_64.so.8
/lib/x86_64-linux-gnu/libc.so.6
/lib/x86_64-linux-gnu/libpthread.so.0
/lib/x86_64-linux-gnu/liblzma.so.5
/lib/x86_64-linux-gnu/libunwind.so.8

sudo cp /usr/bin/strace usr/bin
ldd /usr/bin/strace | awk '{print $3}' > libs.txt
xargs -a libs.txt cp -t lib/x86_64-linux-gnu

strace
bin/sh: strace: not found

# file type
file usr/bin/strace 
usr/bin/strace: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2 ...

# symbolic link
ls -l lib64/ld-linux-x86-64.so.2 
lib64/ld-linux-x86-64.so.2 -> /lib/x86_64-linux-gnu/ld-2.31.so
