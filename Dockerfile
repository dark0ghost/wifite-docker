FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

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
wget \
net-tools

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
RUN echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

# NETTOYAGE
RUN apt-get --purge autoremove -y \
wget && \
apt-get autoclean -y

# AJOUT UTILISATEUR
RUN useradd -d /home/wifite -m wifite && \
passwd -d wifite && \
adduser wifite sudo

# SELECTION UTILISATEUR
USER wifite

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/wifite

# AJOUT INCLUDES
COPY ./includes/wifite.sh  /home/wifite/wifite.sh
RUN sudo chmod +x wifite.sh

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD ./wifite.sh
