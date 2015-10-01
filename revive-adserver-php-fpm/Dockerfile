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
COPY start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
CMD [""]
