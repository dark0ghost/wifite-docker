# WIFITE

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904488/kali-wifite.png" width="200" height="200"/>


## INDEX

- [WIFITE](#wifite)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/wifite/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/wifite/commits/master)

## INTRODUCTION

Docker image of :

- [wifite](https://github.com/derv82/wifite2)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/wifite/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/wifite)

## PREREQUISITES

Use [docker](https://www.docker.com)

Use a carte wifi with mode monitor

## INSTALL

```docker run -ti --rm --name wifite -v ${HOME}:/home/wifite --privileged --network host alexandreoda/wifite```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wifite/blob/master/LICENSE)
