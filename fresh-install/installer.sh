#!/bin/bash
#
#

echo "Installing Ansible"
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

echo "Ansible was successfully installed"
sleep 2

ansible-playbook installer-playbook.yml

echo "Installing Vagrant HostManager"
sudo vagrant plugin install vagrant-hostmanager

echo "Installing docker ..."
bash ./docker-install.sh

echo "Installing Visual Studio Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code


echo "Finished installing packages"
sleep 5

echo "Generating ssh"
echo "enter e-mail"
read email

ssh-keygen -t rsa -b 4096 -C $email

