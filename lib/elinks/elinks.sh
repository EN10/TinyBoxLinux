# create
sudo apt install elinks
which elinks
ldd /usr/bin/elinks | awk '{print $3}' > libs.txt
mkdir -p lib/x86_64-linux-gnu
xargs -a libs.txt cp -t lib/x86_64-linux-gnu
cp /usr/bin/elinks .
tar -czvf elink.tar.gz lib/ elinks

# install
wget https://github.com/EN10/BusyBoxLinux/raw/main/lib/elinks/elinks.tar.gz
tar -xvzf cd-root.tar.gz
mv elinks /usr/bin/elinks
