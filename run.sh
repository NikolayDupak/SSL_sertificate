#!/usr/bin/bash

echo "Installing ssl check"
sudo mkdir /usr/local/bin/ssl_check
sudo cp page.py /usr/local/bin/ssl_check/
sudo cp ssl_check.py /usr/local/bin/ssl_check/
sudo cp demo.yaml /usr/local/bin/ssl_check/
sudo cp main.py /usr/local/bin/ssl_check/

sudo ln -s  /usr/local/bin/ssl_check/main.py /usr/local/bin/sslcheck
sudo chmod +x /usr/local/bin/ssl_check/main.py
sudo chmod +x /usr/local/bin/ssl_check/page.py
sudo chmod +x /usr/local/bin/sslcheck
sudo chmod o+w /usr/local/bin/ssl_check/demo.yaml

echo "Install done"

echo "Start sslcheck"
sudo cp sslcheck.service /etc/systemd/system/sslcheck.service
sudo systemctl daemon-reload
sudo systemctl enable sslcheck
sudo systemctl start sslcheck
echo "Sslcheck working"

exit 0