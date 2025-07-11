#!/bin/bash

if [ ! -f artisan ]; then
    composer create-project laravel/laravel .
fi

php-fpm
