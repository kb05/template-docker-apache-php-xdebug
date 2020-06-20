# template-docker-apache-php-xdebug
The purpose of this project y create a basic template that contains a image of Apache (2.4.38 Debian) + php (specified version in the .env file) with xdebug configured.

The dockerfile installs the necessary extensions to work with xdebug and configure a entrypoint that save in the container /etc/host file a entry called "docker-host" with the host ip.

To run the project it's necessary save a **.env** file with the HTTP_SERVER_PORT and the PHP_VERSION (you can copy the env.example file).

After that you can use ```docker-compose up``` to start the container and check the functionality.
