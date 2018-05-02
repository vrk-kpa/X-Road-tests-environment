## About the repository

This repository contains X-Road lxd harmonized test automation environment installations used in conjunction with [X-Road](https://github.com/vrk-kpa/X-Road).

## Repositiory content

#### Harmonized test environment setups
* [ansible](ansible)
    > Ansible scripts for environment setup
* [harmonized-test-environment](harmonized-test-environment)
    > Shell scripts for environment setup
* [server-config](server-config)
    > Configuration files for the servers

#### Jenkins files
* [jenkins_config](jenkins_config)
    > Test environment jenkins configuration files
* [pipelines](pipelines)
    > Jenkins pipelines used in LXD, stage and product
* [plugins](plugins)
    > Jenkins plugins
* [vars](vars)
    > Groovy vars for jenkins pipelines

## Installation guide

Guide for installing the harmonized test environment

#### 1. Install Ubuntu16.04 or Lubuntu16.04
* Get the latest Ubuntu 16.04 LTS image: http://releases.ubuntu.com/16.04/ or Lubuntu 16.04 LTS image: https://lubuntu.net/downloads/
* **Note!** Virtualbox installation needs 10gb of ram, 30gb of hard disk space, 2 cores and 3d acceleration with 128 video memory
* **Note!** Lubuntu might work better in slower environments
* **Note!** Recommend install default admin user as "jenkins" 

#### 2. Setup linux settings

* Ubuntu 
	* Remove lock from settings > brightness & lock > lock off and turn screen off when inactive for to never.
* Lubuntu 
	* Remove lock from power management settings
	* Install ibus and remove check from ibus advanced settings options.
	* Check keyboard layout is set to use ibus

#### 3. Give user "jenkins" sudoers access rights
* Create jenkins user if it does not exist
```
usermod -aG sudo jenkins
```

* Add jenkins user to sudoers file
```
sudo sh -c 'echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
```

* Change user to jenkins

#### 4. Install git, create or copy ssh key and clone repositories

* Add git and keys ( use jenkins user)
```
sudo su jenkins
sudo apt-get -y install git
mkdir -p /home/jenkins/github
mkdir -p /home/jenkins/.ssh
```

* Clone repositories under Github folder
```
cd /home/jenkins/github
git clone https://github.com/vrk-kpa/X-Road
git clone https://github.com/vrk-kpa/X-Road-tests-environment
```

#### 5. Install pre-setup configuration

Shell script to install Ansible and LXD.
```
cd /home/jenkins/github/X-Road-tests-environment/harmonized-test-environment
sudo chmod u+x install_pre_setup.sh
./install_pre_setup.sh
```

Accept LXD init with all default values

#### 6. Install LXD Containers and harmonized setup tools

* Ansible playbook install tools:
	* SOAP mockserver
	* SOAP UI
	* SSH server
	* Pycharm
	* Webserver
	* QAutomate
	* Jenkins
	* Other libraries and modules

* Run installation scripts
    ```
    cd /home/jenkins/github/X-Road/ansible
    sudo ansible-playbook -i /home/jenkins/github/X-Road-tests-environment/ansible/hosts/xroad_hosts.txt xroad_init.yml
    cd /home/jenkins/github/X-Road-tests-environment/ansible
    sudo ansible-playbook -i hosts/xroad_hosts.txt xroad_automation.yml
    ```
    In case of failure retry.
    

#### 7. Add ssh keys to allow ssh.
```
# Copy or create ssh key
# e.g https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo chmod 400 /home/jenkins/.ssh/id_rsa
```
Restart cmd
```
# When asked give yes and password which is secret
ssh-copy-id -i .ssh/id_rsa.pub user@xroad-lxd-cs.lxd
# When asked give yes and password which is secret
ssh-copy-id -i .ssh/id_rsa.pub user@xroad-lxd-ss0.lxd
# When asked give yes and password which is secret
ssh-copy-id -i .ssh/id_rsa.pub user@xroad-lxd-ss1.lxd
# When asked give yes and password which is secret
ssh-copy-id -i .ssh/id_rsa.pub user@xroad-lxd-ss2.lxd
```

#### 8. Change lxc folder owner	
```		
cd /home/jenkins/.config	
sudo chown -R jenkins:jenkins lxc	
```	
Restart linux for changes to take effect

#### 9. LXD container configuration uploads

- Open jenkins on localhost:8080
- Upload softreset and other configuration files to LXD containers by running jenkins job environment-job-upload-lxd-confs

#### 10 Run regression tests

- Run regression or environment jobs from jenkins
- Jobs descriptions can be found in jenkins_config [README](jenkins_config/jobs/README.md)

## Resetting X-Road servers

There are three ways of resetting X-Road servers.

#### 1. Create lxd containers from scratch (install xroad servers)
```
sudo ansible-playbook -i hosts/xroad_hosts.txt xroad_automation.yml
```

#### 2. Softreset xroad servers from latest xroad develop version
```
lxc exec xroad-lxd-cs ./softreset.sh
lxc exec xroad-lxd-ss0 ./softreset.sh
lxc exec xroad-lxd-ss1 ./softreset.sh
lxc exec xroad-lxd-ss2 ./softreset.sh
```

## Using lxd jenkins pull and push

LXD jenkins configuration jobs are maintained with ansible playbook scripts

* Reload jenkins config from SCM git:
    * Option 1 Update all jenkins jobs ( updating and new jobs )
    ```
    cd /home/jenkins/github/X-Road-tests-environment/ansible
    sudo ansible-playbook -i hosts/xroad_hosts.txt xroad_jenkins_pull.yml
    ```

    * Option 2 Fetch all jenkins configs, plugins and jobs (removing old jobs)
    ```
    cd /home/jenkins/github/X-Road-tests-environment/ansible
    sudo ansible-playbook -i hosts/xroad_hosts.txt xroad_jenkins_pull.yml -e "clean_install=true"
    ```
