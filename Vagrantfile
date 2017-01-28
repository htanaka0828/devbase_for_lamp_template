# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = false
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--vram", 16]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.gui = false
  end

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network :private_network, ip: "192.168.33.110"
  config.vm.hostname = "htanaka0828.devbase.dev"
  config.hostsupdater.aliases = [
    "htanaka0828.devbase.dev",
    "sample.htanaka0828.devbase.dev"
  ]

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/init.sh
  SHELL
end
