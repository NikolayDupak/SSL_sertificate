#!/usr/bin/bash

echo "Installing ssl check"
mkdir /usr/local/bin/ssl_check
cp page.py /usr/local/bin/ssl_check
cp ssl_check.py /usr/local/bin/ssl_check
cp demo.yaml /usr/local/bin/ssl_check
cp main.py /usr/local/bin/ssl_check
ln -s /usr/local/bin/ssl_check /usr/local/bin/ssl_check/main.py
chmod +x /usr/local/bin/ssl_check
echo "Install done"

echo "Start sslcheck"
sudo cp sslcheck.service /etc/systemd/system/sslcheck.service
sudo systemctl daemon-reload
sudo systemctl enable sslcheck
sudo systemctl start sslcheck
echo "Sslcheck working"

exit 0

sudo yum install -y python3
sudo yum install -y python3-pip
sudo yum install -y openssl-devel libffi-devel
yum install python3-pyOpenSSL.noarch
sudo pip3 install pyOpenSSL
sudo pip3 install flask
sudo pip3 install setuptools-rust
pip3 install pyyaml