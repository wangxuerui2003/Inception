FROM debian:buster

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
	php7.3-redis \
	sendmail \
	; \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/wordpress_pool.conf /etc/php/7.3/fpm/pool.d

# Install wp-cli
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT [ "/entrypoint.sh" ]

# Run php-fpm in the foreground
CMD ["php-fpm7.3", "-F"]
