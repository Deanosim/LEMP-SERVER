FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

#setup nginx service
RUN mkdir /etc/service/nginx
COPY nginx.sh /etc/service/nginx/RUN
RUN chmod +x /etc/service/nginx/run

#install programs
RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nginx \
        mariadb \
        php-fpm \
        php-mysql \
        curl \
        gpg 
#install Zerotier
RUN curl -s https://install.zerotier.com/ -o installzt.sh && \
        chmod +x installzt.sh && \
        bash installzt.sh && \
        rm installzt.sh
#clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 443
VOLUME ["/data"]
