#!/bin/sh

# PATH TO YOUR HOSTS FILE
TEMP_HOST="/tmp/tempHost"
ETC_HOSTS="/etc/hosts"
DOCKER_HOST_DOMAIN="docker-host"

# Remove the previous DOCKER_HOST_DOMAIN line
cat $ETC_HOSTS | grep -v $DOCKER_HOST_DOMAIN  > $TEMP_HOST;
echo /dev/null > $ETC_HOSTS;
cat $TEMP_HOST >> $ETC_HOSTS;
rm $TEMP_HOST;

# Add the new host ip
echo $(/sbin/ip route|awk '/default/ { print $3 }') "docker-host" >> $ETC_HOSTS;
docker-php-entrypoint apache2-foreground;
