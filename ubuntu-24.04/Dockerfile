## OpenWRT v24.10.0-rc5
## 
##
##  docker build -t some-app --build-arg SSH_KEY="$(cat ~/file/outside/build/context/id_rsa)" .
##
## ARG SSH_KEY
## RUN echo "$SSH_KEY" > /root/.ssh/id_rsa


FROM ubuntu:noble

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
    'libncurses6' \
    'libncurses-dev' \
    'libssl-dev' \
    'python3-distutils-extra' \
    'python3-setuptools' \
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
    'man-db' && \
    apt clean &&  apt autoremove && apt autoclean && \
    rm -f -r '/var/lib/apt/' &&  rm -f -r '/var/cache/apt/' && \
    useradd -m -U -s /bin/bash -G sudo pusky && \
    echo 'pusky ALL=NOPASSWD: ALL' > /etc/sudoers.d/pusky

USER pusky
RUN export openwrtbranch=openwrt-24.10 && export openwrttag=v24.10.0-rc5 && \
    mkdir /home/pusky/source && mkdir /home/pusky/source/sources && \
    git config --global user.name "pusky" && git config --global user.email "puskyer@gmail.com"

WORKDIR /home/pusky/
 
#RUN cd source/ && git clone https://git.openwrt.org/openwrt/openwrt.git -b openwrt-24.10 openwrt && \
#    cd openwrt &&  git checkout openwrt-24.10 && git pull && \
#    git fetch -t && git checkout v24.10.0-rc5 && git pull origin openwrt-24.10 && \
#    ln -s /home/pusky/source/sources dl && cp feeds.conf.default  feeds.conf && \
#    sudo chmod a+rwx .config && \
#    ./scripts/feeds update -a && ./scripts/feeds install -a && \
#    wget https://downloads.openwrt.org/releases/24.10.0-rc5/targets/x86/64/config.buildinfo -O .config && \
#    make defconfig  # prereq download toolchain/compile

CMD ["bash"]


################################
### Set up workdir
################################
###  docker run -v d:/src/source:/home/pusky/sources -it openwrt_builder /bin/bash
###  ENV STAGING_DIR=/home/user/openwrt/staging_dir
#### ENV TOOLCHAIN_DIR=$STAGING_DIR/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-0.9.33.2
###  ENV LDCFLAGS=$TOOLCHAIN_DIR/usr/lib
###  ENV LD_LIBRARY_PATH=$TOOLCHAIN_DIR/usr/lib
###  ENV PATH=$TOOLCHAIN_DIR/bin:$PATH
###  ENV CC=mips-openwrt-linux-uclibc-gcc
