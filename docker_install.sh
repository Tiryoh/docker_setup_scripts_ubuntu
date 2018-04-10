#!/usr/bin/env bash

set -eu

sudo apt-get update
[[ ! -z $(dpkg -l | grep docker) ]] && sudo apt-get remove docker docker.io
[[ ! -z $(dpkg -l | grep docker-engine) ]] && sudo apt-get remove docker-engine
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
[[ $(cat /etc/lsb-release | grep DISTRIB_RELEASE | sed -e 's/.*=\([0-9]*\.[0-9]*\)/\1/g') -eq "14.04" ]] && sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
[[ $(sudo apt-key fingerprint 0EBFCD88 | grep "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88") ]] || { sudo apt-key fingerprint 0EBFCD88; echo "apt-key add failed"; exit 1; }
if [[ $(arch | grep -e x86_64 -e i686) ]]; then
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
elif [[ $(arch | grep arm) ]]; then
	sudo add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi
sudo apt-get update
sudo apt-get install -y docker-ce
sudo gpasswd -a $USER docker
