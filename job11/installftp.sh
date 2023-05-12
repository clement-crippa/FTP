apt-get update
apt-get -y upgrade
# Installation de proftpd bind9 openssl et sudo
apt-get install -y proftpd-* bind9 openssl sudo
# Création de 2 utilisateurs
sudo useradd -m Merry -p "$(echo "kalimac" | openssl passwd -1 -stdin)"
sudo useradd -m Pippin -p "$(echo "secondbreakfast" | openssl passwd -1 -stdin)"
# Création des fichiers de configurations
sudo mkdir /etc/proftpd/ssl
sudo mkdir /etc/configproftpd
# Installaitons des configurations des serveurs DNS et FTP
sudo cp ./proftpd.conf /etc/configproftpd/proftpd.conf
sudo cp ./tls.conf /etc/configproftpd/tls.conf
sudo cp ./modules.conf /etc/configproftpd/modules.conf
sudo ln -sf /etc/configproftpd/proftpd.conf /etc/proftpd/proftpd.conf
sudo ln -sf /etc/configproftpd/tls.conf /etc/proftpd/tls.conf
sudo ln -sf /etc/configproftpd/modules.conf /etc/proftpd/modules.conf
sudo cp ./db.192 /etc/bind/db.192
sudo cp ./db.dnsproject.prepa.com /etc/bind/db.dnsproject.prepa.com
sudo cp ./named.conf.local /etc/bind/named.conf.local
sudo cp ./named.conf.options /etc/bind/named.conf.options
echo Création du lien symbolique des config;
# Création de la clé  et du formulaire pour le FTPS
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem <<EOF
FR
France
Marseille
.
.
.
.
EOF
echo Configuration terminé.;
sudo chmod 640 /etc/proftpd/ssl/proftpd.key.pem
sudo chmod 640 /etc/proftpd/ssl/proftpd.cert.pem
# Redémarrage des serveurs
sudo service proftpd restart
echo Redémarrage du serveur FTP
sudo service bind9 restart
echo Redémarrage du serveur DNS
echo Vos serveurs sont désormais installé

