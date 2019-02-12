FROM ubuntu:18.04

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nginx \
        mysql-server \
        php-fpm \
        php-mysql \
        curl \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN curl -s https://install.zerotier.com/ | sudo bash

EXPOSE 80
EXPOSE 443
VOLUME ["/data"]
