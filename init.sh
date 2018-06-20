#!/bin/sh

sudo apt-get -y update
sudo apt-get dist-upgrade

sudo curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker start

docker network rm common_link
docker network create --driver bridge common_link

sudo apt-get install -y sl

sudo mkdir /opt/src
sudo chown -R vagrant:vagrant /opt/src

sudo apt-get -y install samba
sudo cp -p /vagrant/conf/smb.conf /etc/samba/smb.conf
sudo chown root:root /etc/samba/smb.conf
sudo /etc/init.d/samba restart

if [ ! -d ~/.ssh ]; then
  cp -p ssh/id_rsa ~/.ssh
  chmod 600 ~/.ssh/id_rsa
fi
