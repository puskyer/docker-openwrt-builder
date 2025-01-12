## OpenWRT v24.10.0-rc5
## 
##
##  docker build -t some-app --build-arg SSH_KEY="$(cat ~/file/outside/build/context/id_rsa)" .
##
## ARG SSH_KEY
## RUN echo "$SSH_KEY" > /root/.ssh/id_rsa


FROM ubuntu:noble

RUN echo America/Montreal >/etc/timezone
RUN export DEBIAN_FRONTEND=noninteractive

RUN apt update &&\
    apt install -y apt-utils sudo time git subversion build-essential clang bison g++ \
    gcc-multilib g++-multilib bash make libssl-dev patch libncurses6 libncurses-dev libssl-dev zlib1g-dev gawk flex gettext \
    binutils-doc bison-doc bzip2-doc clang-18-doc cpp-doc flex-doc gcc-13-doc gawk-doc autoconf automake libtool gcc-doc \
    gettext-doc icu-doc ncurses-doc libssl-doc libstdc++-13-doc llvm-18-doc m4-doc make-doc pinentry-doc python3-doc \ 
    python-pygments-doc python-setuptools-doc  python3.12-doc readline-doc swig-doc man-db dialog \
    wget file  unzip xz-utils python3 python3-distutils-extra python3-setuptools rsync swig unzip nano && \
    apt clean && \
    useradd -m -U -s /bin/bash -G sudo pusky && \
    echo 'pusky ALL=NOPASSWD: ALL' > /etc/sudoers.d/pusky

USER pusky
WORKDIR /home/pusky
RUN mkdir source
WORKDIR /home/pusky/source
RUN mkdir sources
RUN mkdir bin
RUN openwrtbranch=openwrt-24.10
RUN openwrttag=v24.10.0-rc5
# set git config
RUN git config --global user.name "pusky" && git config --global user.email "puskyer@gmail.com"
# Download and update the sources
RUN git clone https://git.openwrt.org/openwrt/openwrt.git -b openwrt-24.10 openwrt
WORKDIR /home/pusky/source/openwrt
RUN git pull
RUN git fetch -t
RUN git checkout v24.10.0-rc5
RUN cp feeds.conf.default  feeds.conf
COPY x86diffconfig .config
RUN sudo chmod a+rwx .config
RUN ln -s /home/pusky/source/sources dl
RUN ln -s /home/pusky/source/bin bin
RUN ./scripts/feeds update -a
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
RUN make defconfig
RUN make prereq
RUN make download
RUN make toolchain/compile

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
