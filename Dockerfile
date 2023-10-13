FROM php:7.4-apache-bullseye

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt install -y \
libzip-dev \
wget=1.21-1+deb11u1 \
ffmpeg=7:4.3.6-0+deb11u1 \
git

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets
RUN docker-php-ext-install zip

COPY . /var/www/html
WORKDIR /var/www/html

RUN composer install
EXPOSE 80






