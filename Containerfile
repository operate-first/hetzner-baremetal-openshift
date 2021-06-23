# Build:
#    podman build -t quay.io/rbo/hetzner-baremetal-openshift-toolbox:latest .
#
#
#  podman stop hetzner-baremetal-openshift-toolbox-latest
#  podman rm hetzner-baremetal-openshift-toolbox-latest
#  toolbox create --image quay.io/rbo/hetzner-baremetal-openshift-toolbox:latest
#  toolbox enter hetzner-baremetal-openshift-toolbox-latest


FROM registry.fedoraproject.org/fedora-toolbox

ARG OPENSHIFT_VERSION=4.7.12

RUN \
    dnf install -y ansible pip python3-google-auth.noarch vim && \
    pip install hcloud && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.hrobot && \
    ansible-galaxy collection install -p /usr/share/ansible/collections hetzner.hcloud

RUN echo "===== Install $OPENSHIFT_VERSION openshift-install =====" \
 && curl -# -L -o /tmp/openshift-install-linux.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OPENSHIFT_VERSION/openshift-install-linux.tar.gz \
 && tar xzvf /tmp/openshift-install-linux.tar.gz -C /usr/local/bin/ openshift-install \
 && chmod +x /usr/local/bin/openshift-install \
 && rm /tmp/openshift-install-linux.tar.gz
