FROM ubuntu:bionic

LABEL maintainer="support@greencheap.net"

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 80

RUN apt-get update && apt-get -y install ca-certificates nginx wget unzip apt-transport-https software-properties-common -y && \
    add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php8.0 php8.0-fpm \
    php8.0-cli php8.0-mysql php8.0-curl php8.0-xml php8.0-zip php8.0-sqlite3

RUN mkdir /greencheap

WORKDIR /greencheap

VOLUME ["/greencheap/storage", "/greencheap/app/cache"]

RUN chown -R www-data: /greencheap

RUN wget https://greencheap.net/api/atomy/main_packages/latest -O /greencheap/greencheap.zip && \
    unzip /greencheap/greencheap.zip && rm /greencheap/greencheap.zip

ADD nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data: /greencheap/storage && chown -R www-data: /greencheap/packages

RUN php greencheap setup

RUN php-fpm8.0 -t

CMD ["sh", "-c", "service php8.0-fpm start && nginx"]