#!/usr/bin/env bash
apt-get update
apt-get install -y puppet

echo "$1	$(facter fqdn)	puppetmaster" >> /etc/hosts
echo "127.0.0.1	$(facter fqdn)	puppet" >> /etc/hosts
echo "$(facter ipaddress_eth1)	$(facter fqdn)	puppet" >> /etc/hosts

printf "[agent]\nserver=$1" >> /etc/puppet/puppet.conf
puppet agent --enable
puppet agent -tv