# WIFITE

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904488/kali-wifite.png)

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

[![pipeline status](https://gitlab.com/oda-alexandre/wifite/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/wifite/commits/master)
[![Create and publish a Docker image](https://github.com/dark0ghost/wifite/actions/workflows/docker-image-deploy.yml/badge.svg)](https://github.com/dark0ghost/wifite/actions/workflows/docker-image-deploy.yml)

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
docker run -ti --rm --name wifite --privileged --network host -v ${HOME}:/home/wifite  docker pull ghcr.io/dark0ghost/wifite-docker:latest
```

### DOCKER COMPOSE

```yml
version: "3.8"

services:
    wifite:
     build:
      context: .
      dockerfile:
        Dockerfile
    container_name: wifite
    restart: "no"
    network_mode: host
    privileged: true
    volumes:
      - "${HOME}:/home/wifite"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wifite/blob/master/LICENSE)
