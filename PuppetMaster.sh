#!/usr/bin/env bash
apt-get update
apt-get install -y puppetmaster

echo "$(facter ipaddress_eth1)	$(facter fqdn)	puppetmaster" >> /etc/hosts
echo "127.0.0.1	$(facter fqdn)	puppetmaster" >> /etc/hosts

touch /etc/puppet/manifests/site.pp

echo '*.netbuilder.private' >> /etc/puppet/autosign.conf

sudo cp -r /vagrant/puppet/* /etc/puppet/