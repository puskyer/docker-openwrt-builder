docker-openwrt-buildroot
========================
[![Docker Build Status](https://img.shields.io/docker/build/noonien/openwrt-buildroot.svg)](https://hub.docker.com/r/noonien/openwrt-buildroot)
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/noonien/docker-openwrt-buildroot/blob/master/LICENSE)


This is a docker container for the [OpenWRT](https://openwrt.org/)
[buildroot](http://wiki.openwrt.org/doc/howto/buildroot.exigence).

Because the build system requires that its command are not executed by root,
the user `openwrt` was created. The buildroot can be found in
`/home/openwrt/<openwrt buildroot version>`.

To run a shell in the buildroot, execute the following command:
```sh
docker run -it openwrt-buildroot bash
```

To run docker without using sudo
add $USER to docker group
and
sudo setfacl -m user:$USER:rw /var/run/docker.sock

NOTE: for Chaos_calmer Onion Omega ----

to use Dockerfile to build Docker image first do the following before building

docker run -v ~/OnionOmega/ArduinoDock/OpenWRT/:/source -it ubuntu:18.04 /bin/bash

the OpenWRT has the folder source with all the openwrt source for dl

cp -a /source /home/

then do a "docker commit <Container ID> ubuntu:openwrt"

the Dockerfile users ubuntu:openwrt as its starting image

then build using the Dockerfile in the openwrt version number i.e 15.05 for chaos calmer

docker build -t openwrt:chaosCalmer .

then we can rename it 

docker tag <Docker Image ID> ubuntu_16.04:openwrt_15.05

to then run the image to do some development

docker run -v ~/OnionOmega/ArduinoDock/OpenWRT/:/source -it ubuntu_16.04:openwrt_15.05 /bin/bash


Issues & Fix (tbd add to Dockerfile to automote the fixs)

to build individual packages for toubleshooting

make package/<package>/clean V=s
make package/<package>/compile V=s

Issues with compiling i2c-exp-driver

edit  /home/openwrt/chaos_calmer/feeds/onion/i2c-exp-driver/Makefile change 
=3.6 to 3.4 for python


compiling issues with dht-sensors get the following error

Package dht-sensor is missing dependencies for the following libraries:
librt.so.0

To fix

edit /home/openwrt/chaos_calmer/feeds/onion/dht-sensor/Makefile 
change
	DEPENDS:= $(CXX_DEPENDS)
to
        DEPENDS:= +librt $(CXX_DEPENDS)

then it works

More information on how to use this buildroot can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).
