#!/usr/bin/bash

echo "Installing ssl check"
if [[ ! -d /usr/local/bin/ssl_check ]]
then
  sudo mkdir /usr/local/bin/ssl_check
fi
sudo cp page.py /usr/local/bin/ssl_check/
sudo cp ssl_check.py /usr/local/bin/ssl_check/
sudo cp demo.yaml /usr/local/bin/ssl_check/
sudo cp main.py /usr/local/bin/ssl_check/
if [[ ! -f /usr/local/bin/sslcheck ]]
then
  sudo ln -s  /usr/local/bin/ssl_check/main.py /usr/local/bin/sslcheck
fi
sudo chmod +x /usr/local/bin/ssl_check/main.py
sudo chmod +x /usr/local/bin/ssl_check/page.py
sudo chmod +x /usr/local/bin/sslcheck
sudo chmod o+w /usr/local/bin/ssl_check/demo.yaml

echo "Install done"

echo "Start sslcheck"
if [[ -f /etc/systemd/system/sslcheck.service ]]
then
  sudo systemctl stop sslcheck
fi
sudo cp sslcheck.service /etc/systemd/system/sslcheck.service
sudo systemctl daemon-reload
sudo systemctl enable sslcheck
sudo systemctl start sslcheck
echo "Sslcheck working"

exit 0