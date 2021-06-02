# Network configuration

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/performing_an_advanced_rhel_installation/kickstart-and-advanced-boot-options_installing-rhel-as-an-experienced-user#network-boot-options_kickstart-and-advanced-boot-options
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/configuring_and_managing_networking/index
https://access.redhat.com/solutions/1202893
https://developer.gnome.org/NetworkManager/stable/nm-settings-keyfile.html


1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 90:1b:0e:bb:24:cb brd ff:ff:ff:ff:ff:ff
    inet 88.99.58.72/26 brd 88.99.58.127 scope global noprefixroute enp0s31f6
       valid_lft forever preferred_lft forever
5: enp0s31f6.4000@enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1400 qdisc noqueue state UP group default qlen 1000
    link/ether 90:1b:0e:bb:24:cb brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.3/24 brd 10.0.1.255 scope global noprefixroute enp0s31f6.4000
       valid_lft forever preferred_lft forever
    inet6 fe80::7186:6cf8:e5e6:893e/64 scope link noprefixroute
       valid_lft forever preferred_lft forever

```
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




# Brdige stuff

https://lukas.zapletalovi.com/2015/09/fedora-22-libvirt-with-bridge.html
