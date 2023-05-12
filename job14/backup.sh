#!/bin/bash
sudo apt-get -y install ftp
date=$(date +%d-%m-%Y-%H.%M)
back=backup_$date
sudo tar -czvf $back.tar.gz /etc/proftpd /etc/bind

HOST=192.168.206.134
USER=clem
PASSWORD=1234

ftp -inv $HOST <<EOF
user $USER $PASSWORD
mput $back.tar.gz
bye
EOF
sudo rm $back.tar.gz
