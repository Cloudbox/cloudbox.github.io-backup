#!/bin/sh
#################################################################################
# Title:         Install Dependencies Script                                    #
# Author:        Cloudbox Team                                                  #
# URL:           https://github.com/Cloudbox/Cloudbox                           #
# Description:   Installs dependencies needed for Cloudbox.                     #
# --                                                                            #
# Part of the Cloudbox project: https://cloudbox.rocks                          #
#################################################################################
# GNU General Public License v3.0                                               #
#################################################################################
# Usage:                                                                        #
# ======                                                                        #
# Ansible 2.5.2:                                                                #
# curl -s https://cloudbox.rocks/install_dependencies.sh | sudo sh              #
# wget -qO- https://cloudbox.rocks/install_dependencies.sh | sudo sh            #
#                                                                               #
# Ansible 2.3.1:                                                                #
# curl -s https://cloudbox.rocks/install_dependencies.sh | sudo sh -s 2.3.1     #
# wget -qO- https://cloudbox.rocks/install_dependencies.sh | sudo sh -s 2.3.1   #
#################################################################################

## Disable IPv6
grep -q -F 'net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
grep -q -F 'net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
grep -q -F 'net.ipv6.conf.lo.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
sysctl -p

## Install Dependencies
apt-get update
apt-get install -y --reinstall \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip
python3 -m pip install --upgrade --force-reinstall \
    pyOpenSSL \
    pip \
    setuptools \
    requests \
    netaddr
python -m pip install --upgrade --force-reinstall \
    pyOpenSSL \
    pip \
    setuptools \
    ansible==${1-2.5.2} \
    requests \
    netaddr

## Copy pip to /usr/bin
cp /usr/local/bin/pip /usr/bin/pip
cp /usr/local/bin/pip3 /usr/bin/pip3
