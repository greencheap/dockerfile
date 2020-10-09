[![GreenCheap Banner](https://camo.githubusercontent.com/cc38f2eec46fb1d1e62e4b203de74fd1d2a9eb63/68747470733a2f2f7265732e636c6f7564696e6172792e636f6d2f64776d656a736c78352f696d6167652f75706c6f61642f76313539393339313331322f677265656e63686561702f677265656e63686561702d77616c6c70617065725f6a31676c77302e6a7067)](https://greencheap.net)

## GreenCheap CMS

* [GreenCheap.com](https://greencheap.net)
* [Github](https://github.com/greencheap/greencheap/)

Docker image for the GreenCheap CMS

**Uses nginx + php7.4-fpm + MySQL**

## Usage
```
$ docker run -d -p 8080:80 greencheap/greencheap
```

## Use with a MySQL container
```
$ docker run -d \
  -e MYSQL_ROOT_PASSWORD=YOURPASSWORD \
  -e MYSQL_DATABASE=greencheap \
  --name greencheap-mysql \
  mysql
```
```
$ docker run -d \
  -p 8080:80 \
  --link greencheap-mysql:mysql \
  --name greencheap-web \
  greencheap/greencheap
```
On install, use `mysql` as host.

## Use Docker-compose

* `mkdir ~/greencheap && cd ~/greencheap && vim docker-compose.yml`
```
version: '2'
services:
  db:
    image: mysql
    expose:
        - "3306"
    environment:
        - MYSQL_ROOT_PASSWORD=YOURPASSWORD
        - MYSQL_DATABASE=greencheap
    volumes:
        - ~/greencheap/mysql:/var/lib/mysql
  greencheap:
    image: greencheap/greencheap
    ports:
        - "8080:80"
    links:
        - db:db
    volumes:
        - ~/greencheap/storage:/greencheap/storage
        - ~/greencheap/app/cache:/greencheap/app/cache
```
* Change your password `YOURPASSWORD`
* Run `cd ~/greencheap && docker-compose up -d`
* On install, use `db` as host.
