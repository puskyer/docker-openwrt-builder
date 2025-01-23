#!/bin/bash

docker rmi ubuntu-24.04/openwrt:latest
docker build -t ubuntu-24.04/openwrt:latest  .
#docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' \
#       --volume "$HOME"/build/archive:/home/pusky/archive/ \
#       --workdir '/home/pusky/openwrt/' ubuntu-24.04/openwrt:latest  /bin/bash
docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' \
       --volume "$HOME"/build/source:/home/pusky/source/ ubuntu-24.04/openwrt:latest  /bin/bash
