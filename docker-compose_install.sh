#!/bin/bash -eu

TARGET_DOCER_COMPOSE_VERSION=$(curl -sSfL https://api.github.com/repos/docker/compose/releases/latest | grep html_url | grep docker |sed -e 's/.*tag\/\(.*\)".*/\1/g')

[[ -z ${TARGET_DOCER_COMPOSE_VERSION} ]] && TARGET_DOCER_COMPOSE_VERSION=1.20.1
echo "docker-compose version : " ${TARGET_DOCER_COMPOSE_VERSION}
sudo curl -L "https://github.com/docker/compose/releases/download/${TARGET_DOCER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
