#!/bin/sh
#################################################################################
# Title:         Cloudbox: Dependencies Installer                               #
# Author(s):     L3uddz, Desimaniac, EnorMOZ                                    #
# URL:           https://github.com/Cloudbox/Cloudbox                           #
# Description:   Installs dependencies needed for Cloudbox.                     #
# --                                                                            #
#             Part of the Cloudbox project: https://cloudbox.works              #
#################################################################################
#                     GNU General Public License v3.0                           #
#################################################################################
# Usage:                                                                        #
# ======                                                                        #
# Ansible version: default                                                      #
# curl -s https://cloudbox.works/dep.sh | sudo sh                               #
# wget -qO- https://cloudbox.works/dep.sh | sudo sh                             #
#                                                                               #
# Ansible version: custom                                                       #
# curl -s https://cloudbox.works/dep.sh | sudo sh -s 2.5.1                      #
# wget -qO- https://cloudbox.works/dep.sh | sudo sh -s 2.5.1                    #
#################################################################################

## Appveyor
if [ "$SUDO_USER" = "appveyor" ]; then
    rm /etc/apt/sources.list.d/*
    rm /etc/apt/sources.list
    curl https://raw.githubusercontent.com/Cloudbox/cloudbox.github.io/develop/scripts/apt-sources/xenial.txt | tee /etc/apt/sources.list
    apt-get update
fi

## Environmental Variables
export DEBIAN_FRONTEND=noninteractive

## Disable IPv6
if [ -f /etc/sysctl.d/99-sysctl.conf ]; then
    grep -q -F 'net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    grep -q -F 'net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    grep -q -F 'net.ipv6.conf.lo.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    sysctl -p
fi

## Install Pre-Dependencies
apt-get install -y --reinstall \
    software-properties-common

## Add APT repos
add-apt-repository main
add-apt-repository universe
add-apt-repository restricted
add-apt-repository multiverse
apt-get update

## Install APT Dependencies
apt-get install -y --reinstall \
    nano \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip

## Install PIP3 Dependencies
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pip==9.0.3
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    setuptools
python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr

## Install PIP2 Dependencies
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pip==9.0.3
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    setuptools
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr \
    ansible==${1-2.5.8}

## Copy pip to /usr/bin
cp /usr/local/bin/pip /usr/bin/pip
cp /usr/local/bin/pip3 /usr/bin/pip3
