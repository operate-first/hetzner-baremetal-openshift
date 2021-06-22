# Troubleshooting


## Server do not boot => Check boot flag

Check boot disk flag
```
$ fdisk -l /dev/nvme0n1
Disk /dev/nvme0n1: 477 GiB, 512110190592 bytes, 1000215216 sectors
Disk model: THNSN5512GPU7 TOSHIBA
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x381f7e6d

Device         Boot Start       End   Sectors   Size Id Type
/dev/nvme0n1p1       2048 237365247 237363200 113.2G 8e Linux LVM
```

```
gdisk /dev/nvme1n1
GPT fdisk (gdisk) version 1.0.3

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present
```

## How to delete mbr

```
dd if=/dev/zero of=/dev/sdc bs=512 count=1
```

## Delete software raid

In case `./wipe-server.yaml` failes with `Device or resource busy`, please check software raid:

```bash
root@rescue ~ # cat /proc/mdstat
Personalities : [raid1]
md2 : active raid1 sdb3[0] sda3[1]
      463998784 blocks super 1.2 [2/2] [UU]
      [===>.................]  resync = 15.7% (73277376/463998784) finish=32.1min speed=202359K/sec
      bitmap: 4/4 pages [16KB], 65536KB chunk

md1 : active raid1 sdb2[0] sda2[1]
      523264 blocks super 1.2 [2/2] [UU]

md0 : active raid1 sdb1[0] sda1[1]
      4189184 blocks super 1.2 [2/2] [UU]

unused devices: <none>

root@rescue ~ # mdadm --stop md0 md1 md2
mdadm: stopped md0
mdadm: stopped md1
mdadm: stopped md2
```