#!/bin/bash
# Install Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible
sudo apt-get -y install lxd
echo "Run LXD init"
sudo service lxd start
sudo lxd init

