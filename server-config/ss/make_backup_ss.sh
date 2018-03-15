#!/bin/bash
stop xroad-jetty
stop xroad-signer
stop xroad-monitor
stop xroad-proxy
sudo /usr/share/xroad/scripts/backup_db.sh /root/backed_db_$1
cd /etc
sudo tar -cvf backup_ss_$1.tar xroad/
sudo cp -f /etc/backup_ss_$1.tar /root/backup_ss_$1.tar
start xroad-jetty
start xroad-signer
start xroad-monitor
start xroad-proxy