#!/usr/bin/env bash
apt-get update
apt-get install -y puppet

echo "$1	mtmaster.netbuilder.private	puppetmaster" >> /etc/hosts
echo "127.0.0.1	$(facter fqdn)	puppet" >> /etc/hosts
echo "$(facter ipaddress_eth1)	$(facter fqdn)	puppet" >> /etc/hosts

printf "[agent]\nserver=mtmaster.netbuilder.private" >> /etc/puppet/puppet.conf
puppet agent --enable
puppet agent -tv