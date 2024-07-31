# docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker $USER
docker run --privileged -it ubuntu

# kernel
git clone --depth 1 https://github.com/torvalds/linux.git
# git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git -b linux-6.9.y
# git branch -v
# git checkout tags/v6.10.2 -b 6.10
# git pull --depth 1
# ?? git rebase file conflict ??
# git diff --name-only --diff-filter=U | xargs git checkout --theirs
? # git add .
? # git rebase --continue
# git prune
# git branch -D linux-6.9.y

cd linux

apt update
apt install git make gcc gcc-x86-64-linux-gnu libncurses-dev flex bison
# make menuconfig
make defconfig
# make tinyconfig

apt install bc libelf-dev libssl-dev
# yes "" | make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 8

docker cp a123b456:/root/linux/arch/x86/boot/bzImage ./
