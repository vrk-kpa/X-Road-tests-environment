#!/bin/bash
stop xroad-jetty
stop xroad-signer
echo "Deleting etc/xroad"
sudo rm -rf /etc/xroad/
cp -f /root/backup_cs_$1.tar /etc/backup_cs_$1.tar
cd /etc
sudo tar -xvf backup_cs_$1.tar
sudo /usr/share/xroad/scripts/restore_db.sh /root/backed_db_$1
start xroad-jetty
start xroad-signer

