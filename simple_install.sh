#!/bin/bash
#
#
echo "Getting updates"
sudo apt-get update
sleep 2

echo "Installing Atom"
sudo apt-get install atom
sleep 2

echo "Installing python3"
sudo apt-get install python3
sleep 2

echo "Installing VLC media player..."
sudo apt-get install vlc
sleep2

echo "Installing Conky..."
sudo apt-get install conky
sleep 2

echo "Installing virtualbox..."
sudo apt-get install virtualbox
sleep 2

echo "Installing Ansible..."
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
sleep 2

echo "Installing nginx..."
sudo apt-get install nginx
sleep 2

echo "Installing Docker..."
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sleep 2

echo "Installing Visual Studio Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code
sleep 2

echo "Generating Ssh-key in ${$HOME/.ssh}..."
ssh-keygen -t rsa -b 2048 -N "" -f $HOME/.ssh
sleep 5

echo "Instalation process finished successfully."
echo "##########################################"
