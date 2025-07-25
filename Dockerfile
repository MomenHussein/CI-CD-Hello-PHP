FROM php:8.2-fpm

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    libzip-dev \
    zip \
    unzip \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    && docker-php-ext-install bcmath intl

# Install Node.js + npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Copy project files
COPY . /var/www/html

WORKDIR /var/www/html

RUN mkdir -p storage bootstrap/cache \
  && chmod -R 775 storage bootstrap/cache

RUN chown -R www-data:www-data /var/www/html
