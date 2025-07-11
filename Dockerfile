FROM php:8.2-fpm

RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY . /var/www/html

WORKDIR /var/www/html

RUN mkdir -p storage bootstrap/cache \
  && chmod -R 775 storage bootstrap/cache

RUN chown -R www-data:www-data /var/www/html
