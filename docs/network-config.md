# Network configuration

 * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/performing_an_advanced_rhel_installation/kickstart-and-advanced-boot-options_installing-rhel-as-an-experienced-user#network-boot-options_kickstart-and-advanced-boot-options
 * https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/configuring_and_managing_networking/index
https://access.redhat.com/solutions/1202893
https://developer.gnome.org/NetworkManager/stable/nm-settings-keyfile.html


## Network device naming

lspci output:
```
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219-LM (rev 31)
```

Intel I219-LM => `enp0s31f6`

## Static ip nmconnection example:
```ini
[connection]
id=enp0s31f6
interface-name=enp0s31f6
type=802-3-ethernet
autoconnect=true

[ethernet]
mac-address-blacklist=

[ipv4]
address1=88.99.58.72/26
dns-search=
method=manual
gateway=88.99.58.65
dns=213.133.98.98;213.133.99.99;213.133.100.100;

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto
```

## vlan nmconnection example:
```ini
[connection]
id=vlan4000
uuid=84d1c2e0-9276-45c4-bf00-5071554e06db
type=vlan
interface-name=enp0s31f6.4000
permissions=
timestamp=1607421872

[ethernet]
mac-address-blacklist=
mtu=1400

[vlan]
egress-priority-map=
flags=1
id=4000
ingress-priority-map=
parent=enp0s31f6

[ipv4]
address1=10.0.1.3/24
dns-search=
method=manual
route1=10.0.0.0/16,10.0.1.1

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto

[proxy]
```
