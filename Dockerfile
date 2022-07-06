FROM php:7.4.29-zts

COPY . /usr/src/app
WORKDIR /usr/src/app
EXPOSE 8000

 
RUN apt-get update -y --fix-missing  \
  && apt-get install -y libmcrypt-dev libzip-dev git wget --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
 
RUN wget https://getcomposer.org/download/2.0.9/composer.phar \
    && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

RUN composer install --no-interaction


CMD [ "php", "-t", "/usr/src/app/public", "-S", "0.0.0.0:8000" ]