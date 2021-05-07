#!/usr/bin/bash

echo "Install manual"
# exit 0

sudo yum install -y python3
sudo yum install -y python3-pip
sudo yum install -y openssl-devel libffi-devel
yum install python3-pyOpenSSL.noarch
sudo pip3 install pyOpenSSL
sudo pip3 install flask
sudo pip3 install setuptools-rust
pip3 install pyyaml