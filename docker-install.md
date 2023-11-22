#!/bin/bash

# Steps to install Docker on Ubuntu 22.04
# Based on: https://www.ionos.ca/digitalguide/server/configuration/install-docker-on-ubuntu-2204/

echo "# System updating"
sudo apt-get update
sudo apt-get upgrade

echo "# Removing Docker residues"
sudo apt remove docker-desktop
rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop

echo "# Installing some prerequisites"
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "# Installing Docker certificate"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "# Adding docker repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "# Updating repositories lists"
apt-get update

echo "# Doing IP configuration before install/start docker damon to avoid IP conflict with SFU VPN"
echo "#Creating /etc/docker/daemon.json"
mkdir /etc/docker
tee  /etc/docker/daemon.json << END
{
    "default-address-pools": [
        {
            "base": "10.10.0.0/24",
            "size": 24
        }
    ]
}
END


VERSION_STRING=5:24.0.6-1~ubuntu.22.04~jammy
echo "# Installing Docker version="$VERSION_STRING
sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-compose-plugin



echo "# Adding group docker"
sudo groupadd docker
sudo usermod -aG docker loa10



