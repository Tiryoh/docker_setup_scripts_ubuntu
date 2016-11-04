#!/bin/bash -eu

DISTRIB_CODENAME=`cat /etc/lsb-release | awk -F= '{if($1=="DISTRIB_CODENAME") print $2}'`

sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    echo "deb https://apt.dockerproject.org/repo ubuntu-$DISTRIB_CODENAME main" | sudo tee -a /etc/apt/sources.list.d/docker.list
fi
sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y docker-engine
sudo gpasswd -a $USER docker
