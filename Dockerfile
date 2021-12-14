FROM php:8.0-fpm

COPY composer.lock composer.json /var/www/

WORKDIR /var/www

RUN apt update && \
    apt install -y \
    default-mysql-client \
    npm \
    libonig-dev \
    libxml2-dev \
    libpng-dev \
    zip

RUN docker-php-ext-install pdo_mysql mbstring

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000

USER root

CMD ["php-fpm"]