# TinyBox Linux

TinyBox Linux is a minimal, educational Linux distribution built from scratch. It demonstrates how to build a Linux system using the Linux Kernel and ToyBox for the userspace. The entire distribution fits in a few megabytes.

## Features
*   **Extremely Small**: ~3 MB (Kernel + Initramfs).
*   **Educational**: Built from source to understand the Linux boot process.
*   **Networking**: Includes networking support (DHCP, DNS).
*   **Custom Kernel**: Uses a highly optimized `tinyconfig` kernel.
*   **ToyBox**: Uses minimal utilities for the shell and user environment.

## Current Versions & Sizes
*   **[Linux Kernel](https://www.kernel.org/)**: 6.17.91 ([`bzImage`](bootfiles/bzImage): 2.65 MB)
*   **[ToyBox](https://landley.net/toybox/)**: 0.8.13 ([`initramfs.cpio.gz`](bootfiles/initramfs.cpio.gz): 500 KB)
*   **ISO Image**: [`image.iso`](cd-root/image.iso): 3.7 MB

## Quick Start

### Prerequisites
*   **QEMU**: To run the distribution.
*   **Docker** (Optional): For building in a clean environment.
*   **Linux Build Tools**: `build-essential`, `git`, `curl`, `cpio`, `bison`, `flex`, `bc`, `libelf-dev`, `libssl-dev`.

### QEMU Setup for Windows
*   [QEMU Prebuilt Zip](https://github.com/EN10/TinyBoxLinux/blob/main/bootfiles/qemu-extracted.zip) [38.5 MB] - concise version of the installer [172 MB]

Exe files can be downloaded from here: https://qemu.weilnetz.de/w64/

To recreate the zip using a downloaded installer:
```bash
./extract_qemu.sh qemu-w64-setup-20250826.exe
```

### Running Pre-built Images
You can run the pre-built images located in [`bootfiles/`](bootfiles/) or [`cd-root/`](cd-root/) using QEMU.

**On Windows:**
```powershell
# Run from ISO
.\qemu-system-x86_64.exe -cdrom image.iso

# Run from Kernel + Initrd
.\qemu-system-x86_64.exe -kernel bzImage -initrd initramfs.cpio.gz
```

## Building from Scratch

The build process is divided into three main parts: the Kernel, the Userspace (Root Filesystem), and the Bootable ISO.

### 1. Build the Kernel (`bzImage`)
The kernel is the core of the OS. We use a minimal configuration.

*   **Script**: [`setup.sh`](setup.sh) (for defconfig) or follow [`tinymenuconfig.md`](tinymenuconfig.md) (for tinyconfig).
*   **Process**:
    1.  Clone the Linux kernel source.
    2.  Configure it (`make tinyconfig` then `make menuconfig`).
    3.  Enable necessary features: 64-bit, TTY, Printk, ELF support, Networking (TCP/IP), PCI, E1000 driver.
    4.  Compile: `make -j $(nproc)`.
    5.  Result: `arch/x86/boot/bzImage`.

#### Update on aarch64
```bash
git clone -b linux-6.99.y --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
wget https://raw.githubusercontent.com/EN10/TinyBoxLinux/refs/heads/main/bootfiles/.config
time yes "" | make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- -j 4
```

### 2. Get the Userspace (ToyBox)
The userspace contains the shell (`/bin/sh`) and utilities (`ls`, `cp`, `ip`, etc.). We use ToyBox.

*   **Guide**: [`toybox.md`](toybox.md)
*   **Process**:
    1.  Download the latest pre-built root filesystem from [landley.net](https://landley.net/toybox/downloads/binaries/mkroot/latest/x86_64.tgz).
    2.  Extract `initramfs.cpio.gz`.

### 3. Create Bootable ISO
To boot from a CD/DVD or USB, we wrap the Kernel and Initramfs into an ISO using Syslinux.

*   **Guide**: [`make-isoimage.md`](make-isoimage.md)
*   **Process**:
    1.  Install `syslinux` and `isolinux`.
    2.  Use the kernel's `make isoimage` target or manually create the ISO structure with [`isolinux.bin`](cd-root/isolinux.bin) and `isolinux.cfg`.
    3.  Note: Ensure you point to the correct initramfs (`initramfs.cpio.gz`).

## Directory Structure

*   [`bootfiles/`](bootfiles/): Contains the compiled kernel ([`bzImage`](bootfiles/bzImage)) and initramfs ([`initramfs.cpio.gz`](bootfiles/initramfs.cpio.gz)). Also contains QEMU helper scripts.
*   [`cd-root/`](cd-root/): Contains the ISO image and ISOLINUX configuration.
*   [`lib/`](lib/): Helper scripts for finding dependencies and installing extra packages (like `elinks`, `wget`, `strace`).
*   [`setup.sh`](setup.sh): Script to setup the environment and build a basic system.
*   [`networking.sh`](networking.sh): Script to build BusyBox with networking support.
*   [`tinymenuconfig.md`](tinymenuconfig.md): Documentation for the minimal kernel configuration.
*   [`toybox.md`](toybox.md): Documentation for ToyBox.
*   [`CROSS_COMPILE.sh`](CROSS_COMPILE.sh): Helper for cross-compiling.

## References & Credits

*   [Making Simple Linux Distro from Scratch](https://www.youtube.com/watch?v=QlzoegSuIzg) - [setup.sh](https://github.com/EN10/TinyBoxLinux/blob/main/setup.sh)
*   [Building a tiny Linux kernel](https://weeraman.com/building-a-tiny-linux-kernel) - [menuconfig](https://github.com/EN10/TinyBoxLinux/blob/main/tinymenuconfig.md)
*   [Networking from Gentoo Wiki](https://wiki.gentoo.org/wiki/Custom_Initramfs#Networking) - [networking.sh](https://github.com/EN10/TinyBoxLinux/blob/main/networking.sh)
*   [Find Library Dependencies](https://unix.stackexchange.com/questions/120015/how-to-find-out-the-dynamic-libraries-executables-loads-when-run)
*   [Make a Bootable CD With ISOLINUX](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX) - [make isoimage](https://github.com/EN10/TinyBoxLinux/blob/main/make-isoimage.md)
*   [BusyBox](https://busybox.net), [ToyBox](https://landley.net/toybox)
