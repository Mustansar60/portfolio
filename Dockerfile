FROM php:8.2-apache

# Ye line MySQL extension install karegi jo mysqli error khatam karegi
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

COPY . /var/www/html/
EXPOSE 80
