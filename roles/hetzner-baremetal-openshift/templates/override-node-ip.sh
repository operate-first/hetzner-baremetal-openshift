#!/bin/bash
set -eux

if [ ! -d "/etc/systemd/system/kubelet.service.d/" ] ; then
  mkdir -p /etc/systemd/system/kubelet.service.d/;
fi

KUBELET_NODE_IP=$(awk '/32 host/ { print f } {f=$2}' <<< "$(</proc/net/fib_trie)" | sort -u | grep '192.168.35' | head -1)

if [ -z "$KUBELET_NODE_IP" ] ; then
  echo "Can not determine node ip!"
  exit 1
fi

cat - > /etc/systemd/system/kubelet.service.d/98-nodenet-override.conf <<EOF
[Service]
Environment="KUBELET_NODE_IP=$KUBELET_NODE_IP" "KUBELET_NODE_IPS=$KUBELET_NODE_IP"
EOF
