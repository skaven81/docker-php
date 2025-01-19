FROM php:8-fpm-alpine
RUN apk update && \
    apk add --no-cache libpng-dev libjpeg-turbo-dev libwebp-dev libxpm-dev freetype-dev && \
    docker-php-ext-configure gd --with-jpeg --with-freetype --with-webp --with-xpm && \
    docker-php-ext-install gd exif && \
    docker-php-ext-enable exif
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN sed -i -e 's/memory_limit = .*/memory_limit = 1024M/' $PHP_INI_DIR/php.ini
RUN echo 'pm.max_children = 20' >> $PHP_INI_DIR/conf.d/docker-fpm.ini
