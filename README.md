# wlfs
**Will's Linux From Scratch**

WLFS is a linux distribution built entirely from source.  It contains the Linux Kernel (4.11.5), the GNU C Library, and the core GNU/Linux programs.  The distribution was built following the guidelines of the [Linux From Scratch][1] project (version [8.0][2]).  

## Build

Build was completed on June 25, 2017.  All sources were compiled for *x86_64*.  The distribution is not guaranteed to perform in a production environment.  Please use at own risk.  

## Installation

WLFS uses a [Tiny Core Linux][3] Live CD to accomplish the installation.  The Live CD allows the network installation script to run.  **The WLFS installation script is intended ONLY for machines with no current partitions**.  For machines that are currently partitioned, a [gzip archive][4] is available for you to install to a partition on your machine.    

1. Download [TCL Live CD][5]
2. Boot Live CD in physical or virtual machine
3. Press `[ENTER]` when asked to boot
3. Enter the following commands at the prompt:

```
wget http://willmarkley.com/install.sh
sudo /bin/sh install.sh
```

## Issues

Please file any issues on the issues tab of the project.  


[1]: http://www.linuxfromscratch.org/lfs/
[2]: http://www.linuxfromscratch.org/lfs/view/stable/
[3]: http://tinycorelinux.net/welcome.html
[4]: .
[5]: http://tinycorelinux.net/8.x/x86/release/Core-current.iso
