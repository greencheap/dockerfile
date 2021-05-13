FROM php:8-apache

LABEL maintainer="support@greencheap.net"

ENV DEBIAN_FRONTEND=noninteractive \
    GREENCHEAP_VERSION_ID=23

RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY ./*.pem /etc/apache2/ssl/
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443

RUN apt-get update && apt-get install -y unzip libzip-dev sqlite3 && \
    docker-php-ext-install zip

RUN curl https://greencheap.net/api/atomy/main_packages/download/${GREENCHEAP_VERSION_ID} --output /var/www/html/greencheap.zip && \
    unzip /var/www/html/greencheap.zip && rm /var/www/html/greencheap.zip

WORKDIR /var/www/html

RUN chown -R www-data: /var/www/html

RUN a2enmod headers
RUN a2enmod rewrite