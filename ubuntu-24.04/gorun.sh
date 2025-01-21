#!/bin/bash

#docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' --volume "$HOME"/build/archive/:/home/pusky/source/archive/ --volume "$HOME"/build/archive/source:/home/pusky/source/ --workdir '/home/pusky/source/'    ubuntu-24.04/openwrt:latest  /bin/bash
docker run --interactive --rm --tty --ulimit 'nofile=1024:262144' --volume "$HOME"/build/archive/source:/home/pusky/source/ --workdir '/home/pusky/source/'    ubuntu-24.04/openwrt:latest  /bin/bash

