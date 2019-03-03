# WIFITE

[![dockeri.co](https://dockeri.co/image/alexandreoda/wifite)](https://hub.docker.com/r/alexandreoda/wifite)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/wifite.svg)](https://microbadger.com/images/alexandreoda/wifite)
[![size](https://images.microbadger.com/badges/image/alexandreoda/wifite.svg)](https://microbadger.com/images/alexandreoda/wifite")
[![build](https://img.shields.io/docker/build/alexandreoda/wifite.svg)](https://hub.docker.com/r/alexandreoda/wifite)
[![automated](https://img.shields.io/docker/automated/alexandreoda/wifite.svg)](https://hub.docker.com/r/alexandreoda/wifite)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [wifite](https://github.com/derv82/wifite2)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/wifite)


## PREREQUIS

Installer [docker](https://www.docker.com)

Utiliser une carte wifi avec prise en charge du mode monitor


## INSTALLATION

```
docker run -ti --rm --name wifite -v ${HOME}:/home/wifite --privileged --network host alexandreoda/wifite
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/wifite/blob/master/LICENSE)
