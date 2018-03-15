#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get --yes --force-yes remove xroad-jetty9
sudo apt-get --yes --force-yes remove xroad-autologin
sudo apt-get --yes --force-yes remove xroad-monitor
sudo apt-get --yes --force-yes remove xroad-common
sudo apt-get --yes --force-yes remove xroad-nginx
sudo apt-get --yes --force-yes remove xroad-confclient
sudo apt-get --yes --force-yes remove xroad-signer
sudo apt-get --yes --force-yes remove xroad-base
sudo apt-get --yes --force-yes remove xroad-securityserver-fi
sudo apt-get --yes --force-yes remove xroad-securityserver
sudo apt-get --yes --force-yes remove xroad-addon-messagelog
sudo apt-get --yes --force-yes remove xroad-addon-metaservices
sudo apt-get --yes --force-yes remove xroad-addon-proxymonitor
sudo apt-get --yes --force-yes remove xroad-addon-wsdlvalidator
sudo apt-get --yes --force-yes remove xroad-proxy
dpkg -r xroad-jetty9
dpkg -r xroad-autologin
dpkg -r xroad-monitor
dpkg -r xroad-common
dpkg -r xroad-nginx
dpkg -r xroad-confclient
dpkg -r xroad-signer
dpkg -r xroad-base
dpkg -r xroad-securityserver-fi
dpkg -r xroad-securityserver
dpkg -r xroad-addon-messagelog
dpkg -r xroad-addon-metaservices
dpkg -r xroad-addon-proxymonitor
dpkg -r xroad-addon-wsdlvalidator
dpkg -r xroad-proxy
shopt -s extglob
cd /etc/xroad
sudo rm -rf !(autologin)
cd /root/
sudo rm -rf /var/log/xroad /var/cache/xroad /var/lib/xroad
sudo -H -u postgres psql -c 'DROP DATABASE serverconf'
sudo -H -u postgres psql -c 'DROP DATABASE messagelog'
sudo -H -u postgres psql -c 'DROP USER serverconf'
sudo -H -u postgres psql -c 'DROP USER messagelog'
sudo apt-get update
sudo apt-get -o DPkg::Options::="--force-confmiss" install --fix-missing --reinstall -y xroad-securityserver-fi xroad-autologin
echo "[configuration-client]" >> /etc/xroad/conf.d/local.ini
echo "update-interval=5" >> /etc/xroad/conf.d/local.ini
