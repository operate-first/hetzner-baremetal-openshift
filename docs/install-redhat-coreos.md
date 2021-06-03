# How to install Red Hat CoreOS

### Install coreos on hetzner baremetal

**Important: RHCOS supports only ignition.version 3.1.0**
![](docs/ioctl-error.png)

Boot into rescue system:
```
curl -L -O https://mirror.openshift.com/pub/openshift-v4/clients/coreos-installer/v0.6.0-3/coreos-installer
chmod +x coreos-installer

curl -L -O https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.6/4.6.1/rhcos-4.6.1-x86_64-metal.x86_64.raw.gz

./coreos-installer install /dev/nvme0n1 \
  --ignition-file config.ignition \
  --copy-network --firstboot-args="rd.neednet=1" \
  --network-dir ./network-config/ \
  --insecure \
  --image-file rhcos-4.6.1-x86_64-metal.x86_64.raw.gz
```



Example:

first-boot.ign
```json
{
  "ignition": {
    "version": "3.1.0"
  },
  "passwd": {
    "users": [
      {
        "name": "core",
        "sshAuthorizedKeys": [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAOfl+764UFbDkkxpsQYjET7ZAWoVApSf4I64L1KImoc rbohne@redhat.com"
        ]
      }
    ]
  },
  "storage": {
    "files": [
      {
        "path": "/etc/hostname",
        "contents": {
          "source": "data:,host02.emea.operate-first.cloud"
        },
        "mode": 420
      }
    ]
  }
}
```

```bash

root@rescue ~ # ./coreos-installer install /dev/nvme0n1 \
>   --ignition-file ignition/first-boot.ign \
>   --copy-network --firstboot-args="rd.neednet=1" \
>   --network-dir ./network-config/ \
>   --insecure \
>   --image-url https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.6/4.6.1/rhcos-4.6.1-x86_64-metal.x86_64.raw.gz
Downloading image from https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.6/4.6.1/rhcos-4.6.1-x86_64-metal.x86_64.raw.gz
Downloading signature from https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.6/4.6.1/rhcos-4.6.1-x86_64-metal.x86_64.raw.gz.sig
Failed to fetch signature: fetching signature URL
Signature not found; skipping verification as requested
> Read disk 846.1 MiB/846.1 MiB (100%)
Writing Ignition config
Writing first-boot kernel arguments
Copying networking configuration from ./network-config/
Copying ./network-config/vlan4000.nmconnection to installed system
Copying ./network-config/enp4s0.nmconnection to installed system
Install complete.
```
