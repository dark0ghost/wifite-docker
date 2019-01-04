# WIFITE

![wifite](https://raw.githubusercontent.com/oda-alexandre/wifite/master/img/logo-wifite.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/wifite/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BUILD DOCKER

[![wifite docker build](https://img.shields.io/docker/build/alexandreoda/wifite.svg)](https://hub.docker.com/r/alexandreoda/wifite)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [wifite](https://github.com/derv82/wifite2) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/wifite/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)

Utiliser une antenne avec mode monitor


## INSTALLATION

```
docker run -ti --name wifite -v ${HOME}:/home/wifite --privileged --network host alexandreoda/wifite /bin/bash
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/wifite/blob/master/LICENSE)
