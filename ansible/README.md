## Ansible scripts for configuring ansible scripts

This folder contains test environment configuration ansible scripts

#### Ansible harmonized test environment generation

* [Xroad_automation.yml](xroad_automation.yml)
    > Configure harmonized lxd test environment tools to lxd containers.
    > Configured servers are xroad-lxd-ss0, xroad-lxd-ss1, xroad-lxd-ss2, xroad-lxd-cs, xroad-lxd-ca and xroad-lxd-web.
    * All servers
        > Configurations done to all servers
        * [init-lxd](roles/init-lxd)
        * [xroad-ssh-server](roles/xroad-ssh-server)
        * [xroad-python-tests](roles/xroad-python-tests)
        * [xroad-tools-and-libs](roles/xroad-tools-and-libs)
    * Certificate servers
        > Configurations done to certificate server
        * [xroad-ca-server](roles/xroad-ca-server)
    * Web servers
        > Configurations done to web server
        * [xroad-webserver](roles/xroad-webserver)
        * [xroad-mockserver](roles/xroad-mockserver)
        * apt-get -y install python

#### Ansible lxd jenkins push and pull

* [xroad_jenkins_pull.yml](xroad_jenkins_pull.yml)
    > Update lxd jenkins from repository
* [xroad_jenkins_push.yml](xroad_jenkins_push.yml)
    > Push lxd jenkins changes to repository
