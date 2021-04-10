FROM php:8-apache

LABEL maintainer="support@greencheap.net"

ENV DEBIAN_FRONTEND=noninteractive \
    USER_NAME=admin \
    USER_PASSWORD=1234 \
    GREENCHEAP_VERSION_ID=22

EXPOSE 80

RUN apt-get update && apt-get install -y unzip libzip-dev && \
    docker-php-ext-install zip

RUN curl https://greencheap.net/api/atomy/main_packages/download/${GREENCHEAP_VERSION_ID} --output /var/www/html/greencheap.zip && \
    unzip /var/www/html/greencheap.zip && rm /var/www/html/greencheap.zip

WORKDIR /var/www/html

RUN chown -R www-data: storage && \
    chown -R www-data: packages && \
    chown -R www-data: tmp

RUN a2enmod headers
RUN a2enmod rewrite