FROM php:fpm
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  libpq-dev \
    && docker-php-ext-install mysql \
    && docker-php-ext-install pgsql
ENV REVIVE_ADSERVER_VERSION 3.2.1
COPY revive-adserver-$REVIVE_ADSERVER_VERSION/ /var/www/
COPY php.ini /usr/local/etc/php/
RUN chmod -R a+w /var/www/var \
  && chmod -R a+w /var/www/var/cache \
  && chmod -R a+w /var/www/var/plugins \
  && chmod -R a+w /var/www/var/templates_compiled \
  && chmod -R a+w /var/www/plugins \
  && chmod -R a+w /var/www/www/admin/plugins \
  && chmod -R a+w /var/www/www/images
