FROM debian:buster

RUN apt-get update &&\
    apt-get install -y apt-utils sudo time git-core subversion build-essential g++ bash make libssl-dev patch libncurses5 libncurses5-dev zlib1g-dev gawk flex gettext wget unzip xz-utils python python-distutils-extra python3 python3-distutils-extra nano && \
    apt-get clean && \
    useradd -m -G sudo pusky && \
    echo 'pusky ALL=NOPASSWD: ALL' > /etc/sudoers.d/pusky

USER pusky
WORKDIR /home/pusky
RUN mkdir sources
# set git config
RUN git config --global user.name "pusky" && git config --global user.email "puskyer@gmail.com"
RUN git clone https://git.openwrt.org/openwrt/openwrt.git
WORKDIR /home/pusky/openwrt
RUN ln -s /home/pusky/sources dl
RUN ./scripts/feeds update -a && ./scripts/feeds install -a
RUN make prereq
#### RUN make download

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
