#!/bin/sh

sudo apt-get -y update

sudo curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
curl -L https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker start

sudo docker network rm common_link
sudo docker network create --driver bridge common_link

sudo apt-get install -y sl zip unzip jq expect

sudo mkdir /opt/src
sudo chown -R vagrant:vagrant /opt/src

sudo apt-get -y install samba
sudo cp -p /vagrant/conf/smb.conf /etc/samba/smb.conf
sudo chown root:root /etc/samba/smb.conf
