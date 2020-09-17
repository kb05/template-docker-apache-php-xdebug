ARG PHP_VERSION

FROM php:${PHP_VERSION}-apache

ARG X_DEBUG_PORT

RUN apt-get update

# Base php extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev        \
    libjpeg62-turbo-dev     \
    libmcrypt-dev           \
    libpng-dev              \
    zlib1g-dev              \
    libxml2-dev             \
    libzip-dev              \
    libonig-dev             \ 
    graphviz                \
    ;


#Utils
RUN apt install -y nano
RUN apt install -y iputils-ping 
RUN apt install -y iproute2
RUN apt install -y zip unzip

# Install the composer ( to be able to use it from the container)
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#Xdebug
ENV XDEBUGINI_PATH=/usr/local/etc/php/conf.d/xdebug.ini

RUN pecl install xdebug;
RUN docker-php-ext-enable xdebug;

# Overwrite XDEBUG.ini config
RUN echo "error_reporting = E_ALL" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_connect_back=1" >> $XDEBUGINI_PATH; \
    echo "display_startup_errors = On" >> $XDEBUGINI_PATH; \
    echo "display_errors = On" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_autostart =1" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_enable=1" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_host=docker-host" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_port=$X_DEBUG_PORT" >> $XDEBUGINI_PATH

#Mod rewrite
RUN a2enmod rewrite;

ADD  /scripts/entrypoint.sh /usr/bin/imageEntryPoint
ENTRYPOINT ["imageEntryPoint"]


