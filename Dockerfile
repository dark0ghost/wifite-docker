# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER wifite
ENV DEBIAN_FRONTEND noninteractive

# INSTALL PACKAGES
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
wget && \

# CHANGE OF FILE /etc/apt/sources.list WITH REPOS kali-rolling contrib non-free
echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \

# INSTALL OFS APPLICATIONS
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
wifite && \

# INSTALL OF aircrack-ng & airodump-ng
apt-get build-dep aircrack-ng -y && \
airodump-ng-oui-update && \

# INSTALL OF hcxtools
git clone https://github.com/ZerBea/hcxtools.git && \
cd hcxtools && \
make && make install && \
cd ../ && \
rm -rf hcxtools && \

# INSTALL OF hcxdumptool
git clone https://github.com/ZerBea/hcxdumptool.git && \
cd hcxdumptool && \
make && make install && \
cd ../ && \
rm -rf hcxdumptool && \

# CLEANING
apt-get --purge autoremove -y \
wget \
make && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/* && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# START THE CONTAINER
CMD /bin/bash \
