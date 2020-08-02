FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y sudo time git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

RUN git clone git@github.com:openwrt/chaos_calmer.git &&\
    cp feeds.conf.default feeds.conf &&\
    echo "src-git onion https://github.com/OnionIoT/OpenWRT-Packages.git" >> feeds.conf &&\
    openwrt/scripts/feeds update -a
    
    

