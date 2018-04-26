#!/bin/bash

echo "Enter your default starting with /home/<User> Download directory"
read download_directory
sleep 2
echo "Checking to see if python3 is installed..."
echo "..."
sleep 2

if command -v python3 &>/dev/null; then
	echo "Python 3 is installed"
else
	echo "python3 is not installed"
	echo "Press 1 to install"
	read x
	sleep 2
	if [ $x -eq 1 ]; then
		sudo apt-get install python3
	fi
fi
sleep 2
echo "Continuing"
sleep 2
echo "..."
echo "Checking to see if Jenkins is installed..."

if [ ls $download_directory/apache-tomcat-7.0.86/webapps | grep jenkins ]; then
	echo "Jenkins is installed"
else
	echo "Jenkins is not installed."
	echo "Press 1 to install."
	read y
	if [ $y -eq 1 ]; then
		echo "Installing needed packets"
		sleep 2
		echo "Installing Apache Tomcat"
		wget www-us.apache.org/dist/tomcat/tomcat-7/v7.0.86/bin/apache-tomcat-7.0.86.zip
		cd $download_directory
		unzip apache-tomcat-7.0.86.zip
		cd $download_directory/apache-tomcat-7.0.86/conf
		mv tomcat-users.xml tomcat-users-backup.xml
		cd ~/Desktop
		cp -p tomcat-users.xml $download_directory/apache-tomcat-7.0.86/conf
		cd $download_directory/apache-tomcat-7.0.86/bin
		chmod +x startup.sh
		chmod +x shutdown.sh
		chmod +x catalina.sh
		./startup.sh
		sleep 2
		echo "Downloading Jenkins .war"
		wget updates.jenkins-ci.org/latest/jenkins.war
		echo "Download success. Open Browser and type in localhost:8080 to access Jenkins"
		sleep 2
	else
		echo "something went wrong..."
		sleep 2
	fi
fi
echo "exiting..."
sleep 2
