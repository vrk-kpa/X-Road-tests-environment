#!/bin/bash
stop xroad-jetty
stop xroad-signer
stop xroad-monitor
stop xroad-proxy
sudo cp -f /etc/xroad/db.properties /root/latest.db.properties
sudo rm -rf /etc/xroad/
sudo cp -f /root/backup_ss_$1.tar /etc/backup_ss_$1.tar
cd /etc
sudo tar -xvf backup_ss_$1.tar
sudo cp -f /root/latest.db.properties /etc/xroad/db.properties
echo "[configuration-client]" >> /etc/xroad/conf.d/local.ini
echo "update-interval=5" >> /etc/xroad/conf.d/local.ini
sudo /usr/share/xroad/scripts/restore_db.sh /root/backed_db_$1
start xroad-jetty
start xroad-signer
start xroad-monitor
start xroad-proxy