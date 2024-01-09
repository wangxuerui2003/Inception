FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	nginx \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY www/* /var/www/html

EXPOSE 4587

ENTRYPOINT ["nginx", "-g", "daemon off;"]