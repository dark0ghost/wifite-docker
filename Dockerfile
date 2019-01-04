FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

ENV DEBIAN_FRONTEND noninteractive

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
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

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
RUN echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

# INSTALLATION DES APPLICATIONS
RUN apt-get update && apt-get install --no-install-recommends -y \
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

# BUILD aircrack-ng & airodump-ng
RUN apt-get build-dep aircrack-ng -y && \
airodump-ng-oui-update

# INSTALLATION DE hcxtools
RUN git clone https://github.com/ZerBea/hcxtools.git && \
cd hcxtools && \
make && make install && \
rm -rf ../hcxtools

# INSTALLATION DE hcxdumptool
RUN git clone https://github.com/ZerBea/hcxdumptool.git && \
cd hcxdumptool && \
make && make install && \
rm -rf ../hcxdumptool

# NETTOYAGE
RUN apt-get --purge autoremove -y \
wget \
make && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/*

# AJOUT UTILISATEUR
RUN useradd -d /home/wifite -m wifite && \
passwd -d wifite && \
adduser wifite sudo

# SELECTION UTILISATEUR
USER wifite

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/wifite

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD /bin/bash
