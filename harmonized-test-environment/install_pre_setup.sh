#!/bin/bash
# Install Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install lxd
sudo apt-get install python
sudo apt-get install python-pip
python -m pip install 'ansible==2.5.0' 
echo "Run LXD init"
sudo service lxd start
sudo lxd init

