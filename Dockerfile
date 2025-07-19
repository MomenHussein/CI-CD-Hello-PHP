FROM php:8.2-fpm

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    && docker-php-ext-install bcmath intl

COPY . /var/www/html

WORKDIR /var/www/html

RUN mkdir -p storage bootstrap/cache \
  && chmod -R 775 storage bootstrap/cache

RUN chown -R www-data:www-data /var/www/html
