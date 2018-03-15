#!/bin/bash
# Install all other needed stuff to LXD environment
ip a s dev lxdbr0 | grep -n 'inet 10.' > ip_address_bridge.txt
python get_ip_address.py
sudo cp -f lxd /etc/NetworkManager/dnsmasq.d/lxd
sudo service NetworkManager restart
sudo service tomcat8 stop
sudo python file_change.py
sudo service tomcat8 start
