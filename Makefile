REVIVE_ADSERVER_VERSION ?= 3.2.2

images: php-image nginx-image

nginx-image: .nginx-image-stamp

.nginx-image-stamp: revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver/Dockerfile revive-adserver/nginx.conf revive-adserver/start.sh
	cp -a revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver/
	docker build -t zvelo/revive-adserver revive-adserver
	rm -rf revive-adserver/revive-adserver-$(REVIVE_ADSERVER_VERSION)
	@touch .nginx-image-stamp

php-image: .php-image-stamp

.php-image-stamp: revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver-php-fpm/Dockerfile revive-adserver-php-fpm/php.ini revive-adserver-php-fpm/start.sh
	cp -a revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver-php-fpm/
	docker build -t zvelo/revive-adserver-php-fpm revive-adserver-php-fpm
	rm -rf revive-adserver-php-fpm/revive-adserver-$(REVIVE_ADSERVER_VERSION)
	@touch .php-image-stamp

revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz:
	wget --no-check-certificate https://download.revive-adserver.com/revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz

revive-adserver-$(REVIVE_ADSERVER_VERSION): revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz
	tar zxf revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz

clean:
	@rm -f \
		.php-image-stamp \
		.nginx-image-stamp \
		.php-push-stamp \
		.nginx-push-stamp

push: .php-push-stamp .nginx-push-stamp

.php-push-stamp: .php-image-stamp
	docker push zvelo/revive-adserver-php-fpm:latest
	@touch .php-push-stamp

.nginx-push-stamp: .nginx-image-stamp
	docker push zvelo/revive-adserver:latest
	@touch .nginx-push-stamp

.PHONY: images nginx-image php-image clean push
