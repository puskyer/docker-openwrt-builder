FROM ubuntu:openwrt

RUN apt-get update &&\
    apt-get -y dist-upgrade &&\
    apt-get install software-properties-common python-software-properties &&\
    add-apt-repository ppa:deadsnakes/ppa &&\
    apt-get update &&\
    apt-get install -y sudo time nano git subversion build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip \
                       python libpython-dev python-dev python3.6 python3.6-dev libpython3.6 libpython3.6-dev mlocate dlocate debtags \
                       libpthread-stubs0-dev libpthread-workqueue-dev libxml-simpleobject-perl libxml-simpleobject-enhanced-perl &&\
    sudo apt-get autoremove  &&\
    sudo apt-get autoclean
    
#RUN sudo rm /usr/bin/python3 &&\
#    sudo ln -s  python3.6 /usr/bin/python3 &&\
#    sudo rm /usr/bin/python3m &&\
#    sudo ln -s python3.6m /usr/bin/python3m &&\

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

RUN git clone https://github.com/openwrt/chaos_calmer.git &&\
    cd ~/chaos_calmer &&\
    echo '--- ./include/prereq-build.mk	2020-08-02 13:04:23.376226079 -0400' >prereq-build.patch &&\
    echo '+++ prereq-build.mk	2020-08-02 13:07:22.219413867 -0400' >>prereq-build.patch &&\
    echo '@@ -145,7 +145,7 @@' >>prereq-build.patch &&\
    echo '	svn --version | grep Subversion))' >>prereq-build.patch &&\
    echo ' ' >>prereq-build.patch &&\
    echo ' $(eval $(call SetupHostCommand,git,Please install Git (git-core) >= 1.6.5, \' >>prereq-build.patch &&\
    echo '-	git clone 2>&1 | grep -- --recursive))' >>prereq-build.patch &&\
    echo '+	git clone 2>&1 | grep -- --recurse-submodules))' >>prereq-build.patch &&\
    echo ' ' >>prereq-build.patch &&\
    echo ' $(eval $(call SetupHostCommand,file,Please install the 'file' package, \' >>prereq-build.patch &&\
    echo '	file --version 2>&1 | grep file))' >>prereq-build.patch &&\
    patch ./include/prereq-build.mk < ./prereq-build.patch &&\
    cp feeds.conf.default feeds.conf &&\
    echo 'src-git onion https://github.com/OnionIoT/OpenWRT-Packages.git' >> feeds.conf &&\
    ln -s /home/source dl &&\
    ./scripts/feeds update -a &&\
    ./scripts/feeds install -a &&\
    make prereq && \
    make download



    

