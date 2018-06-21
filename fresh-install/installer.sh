#!/bin/bash
#
#
green=`tput setaf 2`
yellow=`tput setaf 3`
magenta=`tput setaf 5`
clear=`tput sgr0`

echo "${yellow}Installing Ansible${clear}"
sleep 2
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

echo "${green}Ansible was successfully installed${clear}"
sleep 5

ansible-playbook installer-playbook.yml
sleep 5
echo "${yellow}Installing Vagrant HostManager${clear}"
sleep 2
sudo vagrant plugin install vagrant-hostmanager
echo "${green} Vagrant HostManager was successfully installed ${clear}"
sleep 5

echo "${yellow}Installing Docker ... ${clear}"
sleep 2
bash ./docker-install.sh
echo "${green}Docker was successfully installed ${clear}"
sleep 5

echo "${yellow}Installing Visual Studio Code${clear}"
sleep 2
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code
echo "${green}Successfully installed Visual Studio Code${clear}"
sleep 3
echo "Finished installing packages"
sleep 5
echo "${green}The following packages were installed:${clear}"
echo "${magenta}Docker${clear}"
echo "${magenta}VirtualBox${clear}"
echo "${magenta}Ansible${clear}"
echo "${magenta}Visual Studio Code${clear}"
echo "${magenta}Nginx${clear}"
echo "${magenta}apache2${clear}"
echo "${magenta}Git${clear}"
echo "${magenta}Python3${clear}"
sleep 15
echo "Generating ssh"
echo "enter e-mail"
read email

ssh-keygen -t rsa -b 4096 -C $email


echo "${green}FINISHED SETTING UP SYSTEM ! ${clear}"
