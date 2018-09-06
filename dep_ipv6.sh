#!/bin/sh
#################################################################################
# Title:         Cloudbox: Dependencies Installer (IPv6)                        #
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
# Ansible version 2.5.8:                                                        #
# curl -s https://cloudbox.rocks/dep_ipv6.sh | sudo sh                          #
# wget -qO- https://cloudbox.rocks/dep_ipv6.sh | sudo sh                        #
#                                                                               #
# Ansible version specified:                                                    #
# curl -s https://cloudbox.rocks/dep_ipv6.sh | sudo sh -s 2.5.1                 #
# wget -qO- https://cloudbox.rocks/dep_ipv6.sh | sudo sh -s 2.5.1               #
#################################################################################

## Remove IPv6 entries from systctl
sed -i -e '/^net.ipv6.conf.all.disable_ipv6/d' /etc/sysctl.conf
sed -i -e '/^net.ipv6.conf.default.disable_ipv6/d' /etc/sysctl.conf
sed -i -e '/^net.ipv6.conf.lo.disable_ipv6/d' /etc/sysctl.conf
sysctl -p

## Add APT repos
add-apt-repository main
add-apt-repository universe
add-apt-repository restricted
add-apt-repository multiverse
apt-get update

## Install Dependencies
apt-get install -y --reinstall \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall pip==9.0.3
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall setuptools
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr
python -m pip install --disable-pip-version-check --upgrade --force-reinstall pip==9.0.3
python -m pip install --disable-pip-version-check --upgrade --force-reinstall setuptools
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr \
    ansible==${1-2.5.8}

## Copy pip to /usr/bin
cp /usr/local/bin/pip /usr/bin/pip
cp /usr/local/bin/pip3 /usr/bin/pip3
