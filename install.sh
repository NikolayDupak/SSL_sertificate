#!/usr/bin/bash

echo "Install package"

sudo yum install -y python3
sudo yum install -y python3-pip
sudo yum install -y openssl-devel libffi-devel
sudo yum install -y python3-pyOpenSSL.noarch
pip3 install pyOpenSSL
pip3 install flask
pip3 install setuptools-rust
# pip3 install pyyaml
pip3 install yaml

echo "Install done"
exit 0