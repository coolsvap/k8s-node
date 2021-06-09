#!/bin/sh

apt-add-repository ppa:ansible/ansible
apt update
apt install ansible -y

sh /vagrant/set-custom-rc.sh