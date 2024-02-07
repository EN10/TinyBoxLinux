which strace
/usr/bin/strace

ldd /usr/bin/strace
        linux-vdso.so.1 (0x00007ffe7d1f2000)
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f4a2e727000)
        libunwind-ptrace.so.0 => /lib/x86_64-linux-gnu/libunwind-ptrace.so.0 (0x00007f4a2e722000)
        libunwind-x86_64.so.8 => /lib/x86_64-linux-gnu/libunwind-x86_64.so.8 (0x00007f4a2e700000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f4a2e50e000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f4a2e4eb000)
        liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007f4a2e4c2000)
        libunwind.so.8 => /lib/x86_64-linux-gnu/libunwind.so.8 (0x00007f4a2e4a3000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f4a2e8eb000)

ldd /usr/bin/strace | awk '{print $3}'
/lib/x86_64-linux-gnu/librt.so.1
/lib/x86_64-linux-gnu/libunwind-ptrace.so.0
/lib/x86_64-linux-gnu/libunwind-x86_64.so.8
/lib/x86_64-linux-gnu/libc.so.6
/lib/x86_64-linux-gnu/libpthread.so.0
/lib/x86_64-linux-gnu/liblzma.so.5
/lib/x86_64-linux-gnu/libunwind.so.8
