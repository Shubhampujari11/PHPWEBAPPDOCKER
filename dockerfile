FROM 'php:8.1.1-apache'
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli
