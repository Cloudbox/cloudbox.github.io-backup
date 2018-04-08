#!/bin/sh

## Install Dependencies related for Cloudbox Ansible commands.
apt-get update
apt-get install -y \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip
pip3 install --upgrade \
    pip \
    setuptools
/usr/bin/pip install --upgrade \
    pip \
    setuptools
pip3 install \
    request \
    pyOpenSSL
pip install \
    ansible==2.3.1.0 \
    pyOpenSSL \
    requests
