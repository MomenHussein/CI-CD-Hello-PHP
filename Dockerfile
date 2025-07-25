FROM php:8.1-fpm

# Install dependencies (if needed)
RUN apt-get update && apt-get install -y \
    git unzip curl libzip-dev zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Install dependencies
RUN composer install --no-interaction

# Fix permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage

# Expose port if needed
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
