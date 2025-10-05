#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    tailscale \
    python3-certbot \
    python3-pip \
    cockpit-networkmanager \
    cockpit-podman \
    cockpit-selinux \
    cockpit-system \
    neovim \
    fish \
    firewalld \
    helm \
    wget \
    golang

pip3 install --prefix /usr certbot_dns_porkbun

INSTALL_K3S_BIN_DIR=/usr/bin INSTALL_K3S_SKIP_ENABLE=true /ctx/k3s.sh

systemctl enable tailscaled upgrader.timer k3s

rm -r ~/.cache
