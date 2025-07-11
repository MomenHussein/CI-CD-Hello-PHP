FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl unzip zip libzip-dev libpng-dev libjpeg-dev libonig-dev libxml2-dev \
    && docker-php-ext-install zip pdo_mysql mbstring exif pcntl bcmath gd

WORKDIR /var/www

RUN chown -R www-data:www-data /var/www

EXPOSE 9000

CMD ["php-fpm"]
