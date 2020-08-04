FROM ubuntu:openwrt

RUN apt-get update &&\
    apt-get -y dist-upgrade &&\
    apt-get install -y sudo time nano git subversion build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    sudo apt-get autoremove  &&\
    sudo apt-get autoclean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

RUN git clone git://git.openwrt.org/openwrt/openwrt.git -b openwrt-18.06 &&\
    cd ~/openwrt &&\
    cp feeds.conf.default feeds.conf &&\
    echo 'src-git onion https://github.com/OnionIoT/OpenWRT-Packages.git' >> feeds.conf &&\
    ln -s /home/source dl &&\
    ./scripts/feeds update -a &&\
    ./scripts/feeds install -a &&\
    make prereq && \
    make download
