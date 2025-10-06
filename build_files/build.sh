#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    tailscale \
    neovim \
    fish \
    firewalld \
    helm \
    wget \
    golang

INSTALL_K3S_BIN_DIR=/usr/bin INSTALL_K3S_SKIP_ENABLE=true /ctx/k3s.sh

systemctl enable tailscaled upgrader.timer k3s

# see https://docs.k3s.io/installation/requirements?_highlight=firewalld&os=rhel#operating-systems
systemctl disable firewalld
