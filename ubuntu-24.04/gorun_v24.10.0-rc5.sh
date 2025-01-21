#!/bin/bash

#docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' --volume "$HOME"/build/archive/:/home/pusky/source/archive/ --volume "$HOME"/build/archive/source:/home/pusky/source/ --workdir '/home/pusky/source/'    ubuntu-24.04/openwrt:latest  /bin/bash
docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' \
       --volume "$HOME"/build/archive/:/home/pusky/archive/ \
       --workdir '/home/pusky/source/' openwrt/ubuntu-24.04:v24.10.0-rc5  /bin/bash

