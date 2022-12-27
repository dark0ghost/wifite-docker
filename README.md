# WIFITE

![logo](https://github.com/dark0ghost/wifite-docker/blob/main/static/wifite.png?raw=true)

- [WIFITE](#wifite)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![Create and publish a Docker image amd64](https://github.com/dark0ghost/wifite-docker/actions/workflows/build-docker.yml/badge.svg)](https://github.com/dark0ghost/wifite-docker/actions/workflows/build-docker.yml)
[![Create and publish a Docker image amd64](https://github.com/dark0ghost/wifite-docker/actions/workflows/build-docker.yml/badge.svg)](https://github.com/dark0ghost/wifite-docker/actions/workflows/build-docker.yml)

## INTRODUCTION

Docker image of :

- [wifite](https://github.com/derv82/wifite2)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/wifite/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/wifite)

## PREREQUISITES

Use [docker](https://www.docker.com)

Use a carte wifi with mode monitor

## BUILD

### DOCKER RUN

```bash
docker run -it --rm --name wifite --privileged --network host -v ${HOME}:/home/wifite ghcr.io/dark0ghost/wifite-docker:latest
```

### DOCKER COMPOSE

```yml
version: "3.8"

services:
  wifite:
    build:
      context: .
      dockerfile:
        Dockerfile-amd64
    container_name: wifite
    restart: "no"
    network_mode: host
    privileged: true
    volumes:
      - "${HOME}:/home/wifite"
```
```bash 
docker-compose up --build
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wifite/blob/master/LICENSE)
