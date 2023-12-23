FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./conf/nginx.conf /etc/nginx/

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]