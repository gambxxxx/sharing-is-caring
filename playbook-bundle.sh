#!/bin/bash
#
#
echo "Installing Ansible ..."
sleep 2
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

sleep 2

ansible-playbook -i hosts -K installer-playbook.yml

echo "Generating Ssh-key in ${$HOME/.ssh}..."
sleep 2
ssh-keygen -t rsa -b 2048 -N "" -f $HOME/.ssh
sleep 2
