FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
	mariadb-server \
	; \
	rm -rf /var/lib/apt/lists/*

# COPY ./conf/wp_config.sql /

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "/entrypoint.sh" ]

# Run mysql(mariadb) in the foreground
CMD ["mysqld_safe", "--no-daemon"]