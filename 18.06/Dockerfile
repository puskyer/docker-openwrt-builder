FROM ubuntu:openwrt

RUN apt-get update &&\
    apt-get -y dist-upgrade &&\
    apt-get install -y software-properties-common python-software-properties &&\
#    add-apt-repository ppa:deadsnakes/ppa &&\
#    apt-get update &&\
    apt-get install -y sudo time nano git subversion build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip \
 #                      python3.6 python3.6-dev libpython3.6 libpython3.6-dev \
                       python libpython-dev python-dev python-yaml python3-yaml \
                       mlocate dlocate debtags libpthread-stubs0-dev libpthread-workqueue-dev \
                       libxml-simpleobject-perl libxml-simpleobject-enhanced-perl &&\
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
    make download &&\
    make tools/compile &&\
    make toolchain/compile
