#!/bin/sh
#################################################################################
# Title:         Cloudbox: Dependency Installer Script                          #
# Author(s):     L3uddz, Desimaniac, EnorMOZ                                    #
# URL:           https://github.com/Cloudbox/Cloudbox                           #
# Description:   Installs dependencies needed for Cloudbox.                     #
# --                                                                            #
#             Part of the Cloudbox project: https://cloudbox.rocks              #
#################################################################################
#                     GNU General Public License v3.0                           #
#################################################################################
# Usage:                                                                        #
# ======                                                                        #
# Ansible version 2.5.1:                                                        #
# curl -s https://cloudbox.rocks/install_dependencies.sh | sudo sh              #
# wget -qO- https://cloudbox.rocks/install_dependencies.sh | sudo sh            #
#                                                                               #
# Ansible version specified:                                                    #
# curl -s https://cloudbox.rocks/install_dependencies.sh | sudo sh -s 2.4.0     #
# wget -qO- https://cloudbox.rocks/install_dependencies.sh | sudo sh -s 2.4.0   #
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
pip3 install --upgrade --force-reinstall pip==10.0.1
pip3 install --upgrade --force-reinstall setuptools
pip3 install --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr
pip install --upgrade --force-reinstall pip==10.0.1
pip install --upgrade --force-reinstall setuptools
pip install --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr \
    ansible==${1-2.5.1}

## Copy pip to /usr/bin
cp /usr/local/bin/pip /usr/bin/pip
cp /usr/local/bin/pip3 /usr/bin/pip3