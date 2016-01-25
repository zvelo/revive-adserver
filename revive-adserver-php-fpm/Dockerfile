FROM php:fpm
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  ssmtp \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng12-dev \
  libpq-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysql \
    && docker-php-ext-install pgsql
ENV REVIVE_ADSERVER_VERSION 3.2.2
COPY revive-adserver-$REVIVE_ADSERVER_VERSION/ /var/www/
COPY php.ini /usr/local/etc/php/
COPY php-fpm.conf /usr/local/etc/
COPY start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
CMD [""]
