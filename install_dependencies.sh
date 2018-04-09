#!/bin/sh

## Disable ipv6
grep -q -F 'net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
grep -q -F 'net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
grep -q -F 'net.ipv6.conf.lo.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
sysctl -p

## Install Dependencies related for Cloudbox Ansible commands.
apt-get update
apt-get install -y \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip
python3 -m pip install --upgrade \
    pip \
    setuptools
python -m pip install --upgrade \
    pip \
    setuptools
python3 -m pip install \
    request \
    pyOpenSSL
python -m pip install \
    ansible==2.3.1.0 \
    pyOpenSSL \
    requests
