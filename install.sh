#!/usr/bin/bash

echo "Install manual"
# exit 0

sudo yum install -y python3
sudo yum install -y python3-pip
sudo pip3 install pyOpenSSL
sudo pip3 install flask