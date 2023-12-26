FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./conf/nginx.conf /etc/nginx/

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/wxuerui.42.fr.key -out /etc/nginx/ssl/wxuerui.42.fr.crt \
	-subj "/C=MY/ST=Selangor/L=Kuala Lumpur/O=42KL/OU=wxuerui/CN=wxuerui.42.fr"

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]