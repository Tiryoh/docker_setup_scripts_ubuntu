#!/usr/bin/env bash

set -eu

if [ -e /etc/lsb-release ]; then
	OS="ubuntu"
elif [ -e /etc/debian_version ]; then
	OS="debian"
fi

sudo apt-get update
[ ! -z "$(dpkg -l | grep docker)" ] && sudo apt-get remove docker docker.io
[ ! -z "$(dpkg -l | grep docker-engine)" ] && sudo apt-get remove docker-engine
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
[ "${OS}" = "ubuntu" ] && [ "$(cat /etc/lsb-release | grep DISTRIB_RELEASE | sed -e 's/.*=\([0-9]*\.[0-9]*\)/\1/g')" = "14.04" ] && sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

[ -e /etc/lsb-release ] && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
[ -e /etc/debian_version ] && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
[ ! -z "$(sudo apt-key fingerprint '0EBFCD88' | grep '9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88')" ] || { sudo apt-key fingerprint 0EBFCD88; echo "apt-key add failed"; exit 1; }
if [ $(arch | grep -e x86_64 -e i686) ]; then
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${OS} $(lsb_release -cs) stable"
elif [ $(arch | grep arm) ]; then
	[ "${OS}" = "ubuntu" ] && sudo add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	[ "${OS}" = "debian" ] && echo "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
fi
sudo apt-get update
sudo apt-get install -y docker-ce
sudo gpasswd -a $USER docker
