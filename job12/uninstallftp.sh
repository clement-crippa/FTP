##Arrêt des serveurs
sudo systemctl stop bind9
sudo systemctl stop proftpd
##Désinstallation des serveurs et de leur configuration
apt-get remove -y --purge proftpd* openssl bind9
rm -r /etc/configproftpd
##Supression des utilisateurs
sudo deluser --remove-home Merry
sudo deluser --remove-home Pippin
apt-get remove -y --purge sudo
