#!/usr/bin/env bash
apt-get update
apt-get install -y puppetmaster

echo "10.50.15.95	mtmaster.netbuilder.private	puppetmaster" >> /etc/hosts
echo "127.0.0.1	mtmaster.netbuilder.private	puppetmaster" >> /etc/hosts

touch /etc/puppet/manifests/site.pp

echo '*.netbuilder.private' >> /etc/puppet/autosign.conf