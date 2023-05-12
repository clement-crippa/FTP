#!/bin/bash
##Installation de FTP
sudo apt-get -y install ftp
##Définition de la date et l'heure et du nom du fichier
date=$(date +%d-%m-%Y-%H.%M)
back=backup_$date
##Compression des fichiers de proftpd et bind
sudo tar -czvf $back.tar.gz /etc/proftpd /etc/bind
##Définition de l'hôte, l'utilisateur , le mot de passe
HOST=192.168.206.134
USER=clem
PASSWORD=1234
##Connexion au FTP avec l'hôte, l'utilisateur , le mot de passe et envoie le fichier compresser sur le FTP
ftp -inv $HOST <<EOF
user $USER $PASSWORD
mput $back.tar.gz
bye
EOF
sudo rm $back.tar.gz
