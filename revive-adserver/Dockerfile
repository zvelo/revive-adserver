FROM nginx
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV REVIVE_ADSERVER_VERSION 3.2.1
COPY revive-adserver-$REVIVE_ADSERVER_VERSION/ /var/www/
COPY nginx.conf /etc/nginx/conf.d/default.conf
