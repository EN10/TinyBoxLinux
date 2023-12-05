# docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker $USER
docker run --privileged -it ubuntu

# kernel
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux

apt update
apt install git make gcc gcc-x86-64-linux-gnu libncurses-dev flex bison
make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- menuconfig

apt install bc libelf-dev libssl-dev
make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 8
