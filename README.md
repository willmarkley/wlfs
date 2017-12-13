# wlfs
**Will's Linux From Scratch**

WLFS is a linux distribution built entirely from source.  It contains the Linux Kernel (4.11.5), the GNU C Library, and the core GNU/Linux programs.  The distribution was built following the guidelines of the [Linux From Scratch][1] project (version [8.0][2]).  

## Build

Build was completed on June 25, 2017.  All sources were compiled for *x86_64*.  The distribution is not guaranteed to perform in a production environment.  Please use at own risk.  

## Installation

WLFS uses a [Tiny Core Linux][3] Live CD to accomplish the installation.  The Live CD allows the network installation script to run.  **The WLFS installation script is intended ONLY for machines with no current partitions**.  For machines that are currently partitioned, a [gzip archive][4] is available for you to install to a partition on your machine.    

### Network Installation
1. Download [TCL Live CD][5]
2. Boot Live CD in physical or virtual machine
3. Press `[ENTER]` when asked to boot
4. Enter the following commands at the prompt:

```
tce-load -wi openssl
wget https://raw.githubusercontent.com/willmarkley/wlfs/master/install.sh
sudo /bin/sh install.sh
```

5. Eject Live CD and boot machine

```
user:  root
pass:  wlfs
```

## Customization

The following files may need to be updated:
```
/etc/hosts, /etc/fstab, /etc/passwd, /etc/group, /etc/shadow, /etc/ld.so.conf, /etc/sysconfig/rc.site, /etc/sysconfig/network, and /etc/sysconfig/ifconfig.eth0
```

## Presentations

This project has been presented to the Linux User Group at the University of Notre Dame.  More information on the talk can be found on the [ND LUG blog][9]

## Issues

Please file any issues on the issues tab of the project.  

## Future Development

Creating an offline installer by including the [gzip archive][4] and the installation script in the Live CD, for just one initial download.  See [Remastering TCL][6], [ISOLINUX][7], and [mkisofs][8] for more details.  


[1]: http://www.linuxfromscratch.org/lfs/
[2]: http://www.linuxfromscratch.org/lfs/view/stable/
[3]: http://tinycorelinux.net/welcome.html
[4]: https://github.com/willmarkley/wlfs/releases/download/v1.0/wlfs-1.0.tar.gz
[5]: http://tinycorelinux.net/8.x/x86_64/release/CorePure64-current.iso
[6]: http://wiki.tinycorelinux.net/wiki:remastering
[7]: http://www.syslinux.org/wiki/index.php?title=ISOLINUX
[8]: http://www.linuxcommand.org/man_pages/mkisofs8.html
[9]: http://ndlug.org/post/will-markley-linux-from-scratch/
