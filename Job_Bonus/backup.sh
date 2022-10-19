#!/bin/bash
sudo apt-get -y install ftp
date=$(date +%d-%m-%Y-%H.%M)
back=backup_$date
sudo tar -czvf $back.tar.gz /etc/proftpd

HOST=192.168.126.135
USER=dou
PASSWORD=1234

ftp -inv $HOST <<EOF
user $USER $PASSWORD
mput *.tar.gz
bye
EOF