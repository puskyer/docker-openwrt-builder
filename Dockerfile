FROM debian:buster

RUN apt-get update &&\
    apt-get install -y apt-utils sudo time git-core subversion build-essential g++ bash make libssl-dev patch libncurses5 libncurses5-dev zlib1g-dev gawk flex gettext wget unzip xz-utils python python-distutils-extra python3 python3-distutils-extra nano && \
    apt-get clean && \
    useradd -m -G sudo pusky && \
    echo 'pusky ALL=NOPASSWD: ALL' > /etc/sudoers.d/pusky

USER pusky
WORKDIR /home/pusky

# set dummy git config
RUN git config --global user.name "pusky" && git config --global user.email "puskyer@gmail.com"
RUN git clone https://git.openwrt.org/openwrt/openwrt.git
WORKDIR /home/user/openwrt
RUN ./scripts/feeds update -a && ./scripts/feeds install -a

CMD ["bash"]

