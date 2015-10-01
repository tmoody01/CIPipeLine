#!/usr/bin/env bash
apt-get update
apt-get install -y puppet

sudo sed -i "$1"	'mtmaster.netbuilder.private	puppetmaster'  /etc/hosts
sudo sed -i '127.0.0.1	'"$(facter fqdn)"'	puppet'   /etc/hosts
sudo sed -i "$(facter ipaddress_eth1)"'	'"$(facter fqdn)"'	puppet'  /etc/hosts

printf "[agent]\nserver=mtmaster.netbuilder.private" >> /etc/puppet/puppet.conf
puppet agent --enable