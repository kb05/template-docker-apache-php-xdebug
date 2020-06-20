ARG PHP_VERSION

FROM php:${PHP_VERSION}-apache

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


# # MONGODB driver
# RUN docker-php-ext-install mbstring;
# RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
# RUN pecl install mongodb \
#     && docker-php-ext-enable mongodb

# # Redis driver
# RUN pecl install -o -f redis \
# &&  rm -rf /tmp/pear \
# &&  docker-php-ext-enable redis

#Utils
RUN apt install -y nano
RUN apt install -y iputils-ping 
RUN apt install -y iproute2
RUN apt install -y zip unzip

# Install the composer ( to be able to use it from the container)
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#Xdebug
ARG WITH_XDEBUG=false
ENV XDEBUGINI_PATH=/usr/local/etc/php/conf.d/xdebug.ini

RUN pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    echo "error_reporting = E_ALL" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_connect_back=1" >> $XDEBUGINI_PATH; \
    echo "display_startup_errors = On" >> $XDEBUGINI_PATH; \
    echo "display_errors = On" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_autostart =1" >> $XDEBUGINI_PATH; \
    echo "xdebug.remote_enable=1" >> $XDEBUGINI_PATH; \
    echo "remote_host=docker-host" >> $XDEBUGINI_PATH; \
    echo "remote_port=9000" >> ${XDEBUGINI_PATH} 


#Mod rewrite
RUN a2enmod rewrite;

ADD  /scripts/entrypoint.sh /usr/bin/imageEntryPoint
ENTRYPOINT ["imageEntryPoint"]


