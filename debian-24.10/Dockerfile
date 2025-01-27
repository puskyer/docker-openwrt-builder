FROM docker.io/debian:stable-slim

ENV GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
WORKDIR /workdir


  
  RUN echo America/Montreal >/etc/timezone && export DEBIAN_FRONTEND=noninteractive && \
    apt update && apt -y upgrade && apt install --no-install-recommends --no-install-suggests --yes  \ 
    'build-essential' \
    'ca-certificates' \
    'clang' \
    'flex' \
    'bison' \
    'g++' \
    'gawk' \
    'gcc-multilib' \
    'g++-multilib' \
    'gettext' \
    'git' \
	'libncurses5-dev' \
    'libncurses6' \
    'libncurses-dev' \
    'libssl-dev' \
    'python3-distutils-extra' \
    'python3-setuptools' \
	'python3-distutils' \
    'rsync' \
    'unzip' \
    'zlib1g-dev' \
    'file' \
    'wget' \
    'apt-utils' \
    'sudo' \
    'time' \
    'subversion' \
    'bash' \
    'patch' \
    'dialog' \
    'xz-utils' \
    'nano' \ 
    'autoconf' \
    'automake' \
    'libtool' \
    'htop' \
    'man-db' && \
    apt clean &&  apt autoremove && apt autoclean && \
    rm -f -r '/var/lib/apt/' &&  rm -f -r '/var/cache/apt/' && \
    useradd -m -s '/bin/bash' -U 'buildbot'

USER buildbot
WORKDIR /home/buildbot/
COPY x86diffconfig /home/buildbot/x86diffconfig
git config --global user.name "pusky" && git config --global user.email "puskyer@gmail.com"

