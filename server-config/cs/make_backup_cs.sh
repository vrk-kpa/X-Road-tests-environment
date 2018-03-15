#!/bin/bash
stop xroad-jetty
stop xroad-signer
echo "Backup db"
sudo /usr/share/xroad/scripts/backup_db.sh /root/backed_db_$1
cd /etc
sudo tar -cvf backup_cs_$1.tar xroad/
sudo cp -f /etc/backup_cs_$1.tar /root/backup_cs_$1.tar
echo "Start jetty again"
start xroad-jetty
start xroad-signer

