# create
sudo apt install elinks
which elinks

ldd /usr/bin/elinks | awk '{print $3}' | sort > libs.txt
/lib/libfsplib.so.0
/lib/x86_64-linux-gnu/libbz2.so.1.0
/lib/x86_64-linux-gnu/libc.so.6
/lib/x86_64-linux-gnu/libcom_err.so.2
/lib/x86_64-linux-gnu/libcrypt.so.1
/lib/x86_64-linux-gnu/libdl.so.2
/lib/x86_64-linux-gnu/libev.so.4
/lib/x86_64-linux-gnu/libexpat.so.1
/lib/x86_64-linux-gnu/libffi.so.7
/lib/x86_64-linux-gnu/libgcrypt.so.20
/lib/x86_64-linux-gnu/libgmp.so.10
/lib/x86_64-linux-gnu/libgnutls.so.30
/lib/x86_64-linux-gnu/libgpg-error.so.0
/lib/x86_64-linux-gnu/libgpm.so.2
/lib/x86_64-linux-gnu/libgssapi_krb5.so.2
/lib/x86_64-linux-gnu/libhogweed.so.5
/lib/x86_64-linux-gnu/libidn.so.11
/lib/x86_64-linux-gnu/libidn2.so.0
/lib/x86_64-linux-gnu/libk5crypto.so.3
/lib/x86_64-linux-gnu/libkeyutils.so.1
/lib/x86_64-linux-gnu/libkrb5.so.3
/lib/x86_64-linux-gnu/libkrb5support.so.0
/lib/x86_64-linux-gnu/liblua5.1.so.0
/lib/x86_64-linux-gnu/liblzma.so.5
/lib/x86_64-linux-gnu/libm.so.6
/lib/x86_64-linux-gnu/libnettle.so.7
/lib/x86_64-linux-gnu/libp11-kit.so.0
/lib/x86_64-linux-gnu/libperl.so.5.30
/lib/x86_64-linux-gnu/libpthread.so.0
/lib/x86_64-linux-gnu/libresolv.so.2
/lib/x86_64-linux-gnu/libtasn1.so.6
/lib/x86_64-linux-gnu/libtinfo.so.6
/lib/x86_64-linux-gnu/libtre.so.5
/lib/x86_64-linux-gnu/libunistring.so.2

mkdir -p lib/x86_64-linux-gnu
xargs -a libs.txt cp -t lib/x86_64-linux-gnu
cp /lib/libfsplib.so.0 lib
cp /usr/bin/elinks .
tar -czvf elink.tar.gz lib/ elinks
mv . usr/bin/elinks

# install
wget https://github.com/EN10/BusyBoxLinux/raw/main/lib/elinks/elinks.tar.gz
tar -xvzf elinks.tar.gz
mv elinks /usr/bin/elinks
