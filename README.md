# WIFITE


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequisites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [License](#LICENSE)


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

Use a carte wifi with prise in charge of mode monitor


## INSTALL

```
docker run -ti --rm --name wifite -v ${HOME}:/home/wifite --privileged --network host alexandreoda/wifite
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wifite/blob/master/LICENSE)
