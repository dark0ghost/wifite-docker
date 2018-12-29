#!/bin/sh

# LANCEMENT DE WIFITE SI LE FICHIER /usr/bin/wifite EXISTE
if [ -e /usr/lib/python2.7/dist-packages/wifite ]
then
  sudo wifite
else

# INSTALLATION DES APPLICATIONS
  sudo apt-get update && sudo apt-get install --no-install-recommends -y \
  aircrack-ng \
  pixiewps \
  bully \
  pyrit \
  tshark \
  hashcat \
  reaver \
  cowpatty \
  wifite
fi
