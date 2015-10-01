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
RUN rm -rf /var/www/var/cache \
    /var/www/var/plugins \
    /var/www/var/templates_compiled \
    /var/www/plugins \
    /var/www/www/admin/plugins \
    /var/www/www/images \
  && ln -s /data/var/cache /var/www/var/cache \
  && ln -s /data/var/plugins /var/www/var/plugins \
  && ln -s /data/var/templates_compiled /var/www/var/templates_compiled \
  && ln -s /data/plugins /var/www/plugins \
  && ln -s /data/www/admin/plugins /var/www/www/admin/plugins \
  && ln -s /data/www/images /var/www/www/images \
  && chown www-data:www-data \
    /var/www/var \
    /var/www/var/UPGRADE \
    /var/www/var/.htaccess
ENTRYPOINT ["start.sh"]
CMD [""]
