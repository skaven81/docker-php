FROM php:8-fpm-alpine
RUN apk update; apk add libpng-dev libjpeg-turbo-dev
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/lib --with-png-dir=/usr/lib; docker-php-ext-install gd

