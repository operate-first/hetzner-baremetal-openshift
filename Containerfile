# Build:
#    podman build -t quay.io/rbo/hetzner-baremetal-openshift-toolbox:latest .
#
#
#  podman stop hetzner-baremetal-openshift-toolbox-latest
#  podman rm hetzner-baremetal-openshift-toolbox-latest
#  toolbox create --image quay.io/rbo/hetzner-baremetal-openshift-toolbox:latest
#  toolbox enter hetzner-baremetal-openshift-toolbox-latest


FROM registry.fedoraproject.org/fedora-toolbox
RUN \
    dnf install -y ansible pip python3-google-auth.noarch && \
    pip install hcloud
