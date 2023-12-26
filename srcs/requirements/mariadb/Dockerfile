FROM debian:buster

RUN groupadd -r mysql && useradd -r -g mysql mysql --home-dir /var/lib/mysql

RUN apt-get update && apt-get install -y --no-install-recommends \
	mariadb-server \
	; \
	rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# Run mysql(mariadb) in the foreground
CMD ["mysqld", "--user=mysql", "--pid-file=/var/run/mysqld/mysqld.pid", "--console"]