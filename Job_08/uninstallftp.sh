sudo systemctl stop proftpd
apt-get remove -y --purge proftpd* openssl
rm -r /etc/configproftpd
sudo deluser --remove-home Merry
sudo deluser --remove-home Pippin
apt-get remove -y --purge sudo