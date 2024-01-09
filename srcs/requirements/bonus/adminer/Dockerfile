FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	nginx \
	php7.3 \
	php7.3-fpm \
	php7.3-mysql \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

# Download adminer php file and make it available for nginx to serve
RUN mkdir /var/www/html/adminer
ADD https://www.adminer.org/latest.php /var/www/html/adminer/index.php
RUN chown -R www-data:www-data /var/www/html/adminer

# Create the directory for php-fpm socket to live
RUN mkdir -p /run/php && chmod 755 /run/php

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]