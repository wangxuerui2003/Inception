FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	redis-server \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis/redis.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["redis-server", "--daemonize", "no", "--protected-mode", "no"]