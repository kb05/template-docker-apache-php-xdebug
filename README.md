# template-docker-apache-php-xdebug
The purpose of this project y create a basic template that contains a image of Apache + php with xdebug configured.
Current versions:
 - Apache :2.4.38 (Debian).
 - PHP: 7.4.0

The dockerfile installs the necessary extensions to work with xdebug and configure a entrypoint that save in the containter /etc/host file a entry called "docker-host" with the host ip.

To run the project it's necessary save a **.env** file with the HTTP_SERVER_PORT.

After that you can use ```docker-compose up``` to start the container and check the funcionality.

The purpose of this project y create a basic
