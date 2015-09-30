#!/usr/bin/env bash
#apt-get update
apt-get install -y puppetmaster

echo "127.0.0.1	mtpuppetmaster.netbuilder.private	puppetmaster" >> /etc/hosts
echo "10.50.15.170	mtpuppetmaster.netbuilder.private	puppetmaster" >> /etc/hosts

touch /etc/puppet/manifests/site.pp

echo "*" >> /etc/puppet/autosign.conf