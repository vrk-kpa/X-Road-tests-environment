#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get --yes --force-yes remove xroad-jetty9
sudo apt-get --yes --force-yes remove xroad-autologin
sudo apt-get --yes --force-yes remove xroad-common
sudo apt-get --yes --force-yes remove xroad-signer
sudo apt-get --yes --force-yes remove xroad-confclient
sudo apt-get --yes --force-yes remove xroad-nginx
sudo apt-get --yes --force-yes remove xroad-base
sudo apt-get --yes --force-yes remove xroad-center
sudo apt-get --yes --force-yes remove xroad-centralserver
sudo apt-get --yes --force-yes remove xroad-centralserver-monitoring
sudo apt-get --yes --force-yes remove xroad-proxy
dpkg -r xroad-jetty9
dpkg -r xroad-autologin
dpkg -r xroad-common
dpkg -r xroad-signer
dpkg -r xroad-confclient
dpkg -r xroad-base
dpkg -r xroad-center
dpkg -r xroad-centralserver
dpkg -r xroad-centralserver-monitoring
dpkg -r xroad-proxy
shopt -s extglob
sudo rm -rf /etc/xroad/signer
sudo -H -u postgres psql -c 'DROP DATABASE centerui_production'
sudo -H -u postgres psql -c 'DROP USER centerui'
sudo apt-get update
sudo apt-get -o DPkg::Options::="--force-confmiss" install --fix-missing --reinstall -y xroad-centralserver xroad-autologin
sudo -u postgres psql -c "update approved_cas set identifier_decoder_method_name = 'ee.ria.xroad.common.util.FISubjectClientIdDecoder.getSubjectClientId';" centerui_production
