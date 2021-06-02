# OpenShift 4 on Hetzner BareMetal (dedicted server)

## Network Overview

![Network overview](docs/nimages/etwork-overview-v3.png)

## Installation

### Create initial hosts.yaml based on hosts.yaml.example

```bash
cp -v hosts.yaml.example hosts.yaml
$EDITOR hosts.yaml
```

### Hardware preperations

  * Order a BareMetal Server - Issue for sizing: #6

  * Configure DNS ( A & PTR ) for BareMetal Server
      `<hostname>.emea.operate-first.cloud`

  * [Install Centos 8 to determine the network interface name](docs/install-centos-8.md)

  * Add server to `hosts.yaml`

  * Run a RH CoreOS Test installation with ssh-only ignition
    ```bash
    ./reset-server.yaml [-l hostname]
    # SSh into rescue system and run coreos-install command printed out at the end ot the playbook.

    ```

    Check installation, server boot? Can connect via SSH?

  * Boot Rescue mode - should fail! :-)

    ```bash
    ./force-rescue-mode.yaml [-l hostname]
    ```

    Check if resecue system is booted:

      **If NOT**: File a ticket to switch into EFI boot (Example Tickets: Ticket#2021050503020988, Ticket#2021050603003594, Ticket#2021051903013942)

  * Check if you can switch between RH CoreOS and rescue mode.

  * Configure firewall
    ```bash
    ./configure-hrobot-firewall.yaml [-l hostname]
    ```

### DNS & load balancer preperations

  * Configure load balancer:
      * Public for api & ingress
      * Private for api-int

  * Configure DNS entries for
      * `api.<cluster_name>.emea.operate-first.cloud`
      * `api-int.<cluster_name>.emea.operate-first.cloud`
      * `*.apps.<cluster_name>.emea.operate-first.cloud`

All steps are done with one single playbook:

**Important: this step is not idempotent** (Issue #5)

```bash
./configure-lb-and-dns.yaml
```

### OpenShift installation

Prerequisites:
  * At least 4 prepared nodes (see Hardware preperations)
  * DNS & load balancer preperations


#### Reset server

Boots into rescue mode and prepare rescue system to install Red Hat CoreOS

```bash
./reset-server.yaml
```

#### Create ignition config and transfer to hosts

```bash
./create-ignition.yaml
```

#### Run the installer


```bash
./run-installer.yaml
```

Optional split it into two steps:

```bash
./run-installer.yaml --skip-tags reboot
# Check output
./run-installer.yaml --tags reboot
```

Happy troubleshooting, every installation have some surprises. It is unpredictable how the hetzner react with the installation.
