#!/usr/bin/env bash
apt-get update
apt-get install -y puppetmaster

sudo sed -i "$(facter ipaddress_eth1)"'	'"$(facter fqdn)"'	puppetmaster'  /etc/hosts
sudo sed -i '127.0.0.1	'"$(facter fqdn)"'	puppetmaster'  /etc/hosts

touch /etc/puppet/manifests/site.pp


sudo sed -i "*.netbuilder.private" /etc/puppet/autosign.conf

sudo cp -r /vagrant/puppet/* /etc/puppet/