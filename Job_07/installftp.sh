apt-get update
apt-get -y upgrade
apt-get install -y proftpd-* openssl sudo
sudo useradd -m Merry -p "$(echo "kalimac" | openssl passwd -1 -stdin)"
sudo useradd -m Pippin -p "$(echo "secondbreakfast" | openssl passwd -1 -stdin)"
mkdir /etc/proftpd/ssl
mkdir /etc/configproftpd
cp ./proftpd.conf /etc/configproftpd/proftpd.conf
cp ./tls.conf /etc/configproftpd/tls.conf
cp ./modules.conf /etc/configproftpd/modules.conf
ln -sf /etc/configproftpd/proftpd.conf /etc/proftpd/proftpd.conf
ln -sf /etc/configproftpd/tls.conf /etc/proftpd/tls.conf
ln -sf /etc/configproftpd/modules.conf /etc/proftpd/modules.conf
echo Création du lien symbolique des config;
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem
echo Configuration terminé.;
sudo chmod 640 /etc/proftpd/ssl/proftpd.key.pem
sudo chmod 640 /etc/proftpd/ssl/proftpd.cert.pem
sudo systemctl restart proftpd
echo Redémarrage du serveur FTP