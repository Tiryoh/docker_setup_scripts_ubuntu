# docker_setup_scripts_ubuntu
Docker setup scripts for GNU/Linux Ubuntu

[![Build Status](https://travis-ci.org/Tiryoh/docker_setup_scripts_ubuntu.svg?branch=master)](https://travis-ci.org/Tiryoh/docker_setup_scripts_ubuntu)

NOTE: There are official install scripts for Raspberry Pi [here](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/).

## Installation

### Simple Installation

#### docker

```
curl -SsfL https://git.io/ubuntu-docker-install | bash
```

#### docker-compose

```
curl -SsfL https://git.io/ubuntu-docker-compose-install | bash
```

tested on:
* x86_64 CPU
  * Ubuntu 14.04.5 Desktop
  * Ubuntu 16.04.4 Desktop
* armv7l CPU (Raspberry Pi 3)
  * Ubuntu MATE 16.04.4
  * Raspbian Strech 9.1

### Manual Installation

First, download this repository.

```
git clone https://github.com/Tiryoh/docker_setup_scripts_ubuntu.git
```

Next, run `docker_install.sh`.

```
./docker_install.sh
```

## License

This repository is licensed under the MIT license, see [LICENSE]( ./LICENSE  ).

Unless attributed otherwise, everything in this repository is licensed under the MIT license.

