
# Ignition tests

Resources
 * https://docs.fedoraproject.org/en-US/fedora-coreos/hostname/
 *


## Generate ignition

```
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < first-boot.fcc > first-boot.ign
```




## coreos-installer

```bash
sudo coreos-installer install /dev/sda --ignition-url https://raw.githubusercontent.com/rbo/hetzner-baremetal-openshift/main/ignition/first-boot.ign
```

Add `--copy-network --firstboot-args="rd.neednet=1"` if you want fo copy network config


## Use another rescue system

```bash
curl -L -O https://mirror.openshift.com/pub/openshift-v4/clients/coreos-installer/v0.6.0-3/coreos-installer
chmod +x coreos-installer

curl -L -O https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.6/4.6.1/rhcos-4.6.1-x86_64-metal.x86_64.raw.gz

./coreos-installer install /dev/nvme0n1 \
  --ignition-file master-1.ign \
  --copy-network --firstboot-args="rd.neednet=1" \
  --network-dir ./master-1/ \
  --insecure \
  --image-file rhcos-4.6.1-x86_64-metal.x86_64.raw.gz

```

```
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
