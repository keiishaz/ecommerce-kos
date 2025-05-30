#!/bin/sh

composer install --no-dev --optimize-autoloader

php artisan config:cache
php artisan route:cache
php artisan view:cache

php artisan migrate --force

chmod -R 775 storage
chmod -R 775 bootstrap/cache

php -S 0.0.0.0:$PORT -t public
