FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER wifite
ENV HOME /home/${USER}
ENV LOCALES fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install --no-install-recommends -y \
  locales \
  ca-certificates \
  apt-transport-https \
  gnupg \
  pgpgpg \
  dirmngr \
  xz-utils \
  sudo \
  python \
  git \
  curl \
  make \
  gcc \
  wget

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}
  
RUN echo -e '\033[36;1m ******* ADD contrib non-free IN sources.list ******** \033[0m'; \
  echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list; \
  echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list; \
  wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install --no-install-recommends -y \
  net-tools \
  kmod \
  ieee-data \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libcom-err2 \
  libcurl4 \
  liberror-perl \
  libkmod2 \
  libpcap-dev \
  libpci3 \
  libpcre2-8-0 \
  libssl-dev \
  pciutils \
  sqlite3 \
  aircrack-ng \
  pixiewps \
  bully \
  pyrit \
  hashcat \
  reaver \
  cowpatty \
  tshark \
  macchanger \
  wifite

RUN echo -e '\033[36;1m ******* INSTALL AIRCRACK & AIRODUMP ******** \033[0m'; \
  apt-get build-dep aircrack-ng -y
# airodump-ng-oui-update

RUN echo -e '\033[36;1m ******* INSTALL HCXTOOLS ******** \033[0m'; \
  git clone https://github.com/ZerBea/hcxtools.git; \
  cd hcxtools; \
  make && make install; \
  cd ../; \
  rm -rf hcxtools

RUN echo -e '\033[36;1m ******* INSTALL HCXDUMPTOOL ******** \033[0m'; \
  git clone https://github.com/ZerBea/hcxdumptool.git; \
  cd hcxdumptool; \
  make && make install; \
  cd ../; \
  rm -rf hcxdumptool

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
  apt-get --purge autoremove -y \
  wget \
  make; \
  rm /etc/apt/sources.list; \
  rm -rf /var/cache/apt/archives/*; \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  useradd -d ${HOME} -m ${USER}; \
  passwd -d ${USER}; \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD /bin/bash \