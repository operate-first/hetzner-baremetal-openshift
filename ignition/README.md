# Ignition tests

Resources
 * https://docs.fedoraproject.org/en-US/fedora-coreos/hostname/
 *


## Generate ignition

```
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < first-boot.fcc > first-boot.ign
```

## RHCOS supports only ignition.version 3.1.0

[](ioctl-error.png)