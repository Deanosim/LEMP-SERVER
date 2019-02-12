FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nginx \
        mysql-server \
        php-fpm \
        php-mysql \
        curl \
        gpg \
     && apt-get clean

RUN curl -s https://install.zerotier.com/ -o installzt.sh && \
        chmod +x installzt.sh && \
        bash installzt.sh && \
        rm installzt.sh


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 443
VOLUME ["/data"]
