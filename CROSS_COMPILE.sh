# docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker $USER
docker run --privileged -it ubuntu

# kernel
git clone --depth 1 https://github.com/torvalds/linux.git
# git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git -b linux-6.9.y
# git checkout -b linux-6.10.y
# git branch -d linux-6.9.y
# git reset origin/linux-6.10.y
# git reset --hard HEAD
# git rebase --skip
# git pull --depth 1

cd linux

apt update
apt install git make gcc gcc-x86-64-linux-gnu libncurses-dev flex bison
# make menuconfig
make defconfig
# make tinyconfig

apt install bc libelf-dev libssl-dev
# yes "" | make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 8

docker cp a123b456:/root/linux/arch/x86/boot/bzImage ./
