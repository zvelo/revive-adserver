REVIVE_ADSERVER_VERSION ?= 3.2.1

images: php-image nginx-image

nginx-image: .nginx-image-stamp

.nginx-image-stamp: revive-adserver-$(REVIVE_ADSERVER_VERSION)
	cp -a revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver/
	docker build -t zvelo/revive-adserver revive-adserver
	rm -rf revive-adserver/revive-adserver-$(REVIVE_ADSERVER_VERSION)
	@touch .nginx-image-stamp

php-image: .php-image-stamp

.php-image-stamp: revive-adserver-$(REVIVE_ADSERVER_VERSION)
	cp -a revive-adserver-$(REVIVE_ADSERVER_VERSION) revive-adserver-php-fpm/
	docker build -t zvelo/revive-adserver-php-fpm revive-adserver-php-fpm
	rm -rf revive-adserver-php-fpm/revive-adserver-$(REVIVE_ADSERVER_VERSION)
	@touch .php-image-stamp

revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz:
	wget http://download.revive-adserver.com/revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz

revive-adserver-$(REVIVE_ADSERVER_VERSION): revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz
	tar zxf revive-adserver-$(REVIVE_ADSERVER_VERSION).tar.gz

.PHONY: images nginx-image php-image
