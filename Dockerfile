FROM ubuntu:18.04

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nginx \
        mysql-server \
        php-fpm \
        php-mysql \
        curl \
        gpg \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN curl -s 'https://pgp.mit.edu/pks/lookup?op=get&search=0x1657198823E52A61' | gpg --import && \ if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi

EXPOSE 80
EXPOSE 443
VOLUME ["/data"]
