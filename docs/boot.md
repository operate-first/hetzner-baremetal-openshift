```
Check boot disk flag
```
fdisk -l /dev/nvme0n1
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


gdisk /dev/nvme1n1
GPT fdisk (gdisk) version 1.0.3

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present


Delete mbr: dd if=/dev/zero of=/dev/sdc bs=512 count=1