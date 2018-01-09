#!/bin/bash
echo "The current directory is:"
pwd
echo "Move to ~"
cd ~
echo "The user logged in is:"
whoami
func_check_for_root() {
	        if [ ! $( id -u ) -eq 0 ]; then
			echo "ERROR: $0 Must be run as root, Script terminating" ; su 		
    		fi
		        }
func_check_for_root
echo "Your sestem:"
uname -r
echo "Update the apt package index:"
apt-get update
echo "Install packages to allow apt to use a repository over HTTPS:"
apt-get install -y vim
apt-get install -y apt-transport-https
apt-get install -y ca-certificates
apt-get install -y curl
apt-get install -y gnupg2
apt-get install -y software-properties-common
echo "Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
echo "Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
apt-key fingerprint 0EBFCD88
echo "To also add the edge repository, add edge after stable on the last line of the command."
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
echo "Update the apt package index."
apt-get update
echo "Install the latest version of Docker CE, or go to the next step to install a specific version. Any existing installation of Docker is replaced."
apt-get install docker-ce
echo "Verify that Docker CE is installed correctly by running the hello-world image."
docker run hello-world
echo "IP Docker IP interface"
ip addr show docker0
