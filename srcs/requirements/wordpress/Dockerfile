FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	ghostscript \
	php7.3-fpm \
	php7.3-cli \
	php7.3-bcmath \
	php7.3-curl \
	php7.3-imagick \
	php7.3-intl \
	php7.3-json \
	php7.3-mbstring \
	php7.3-mysql \
	php7.3-xml \
	php7.3-zip \
	curl \
	; \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/wordpress_pool.conf /etc/php/7.3/fpm/pool.d

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["php-fpm7.3", "-F"]
