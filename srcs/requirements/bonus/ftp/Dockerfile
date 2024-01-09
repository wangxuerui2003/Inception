FROM debian:buster

RUN apt-get update && apt-get install --no-install-recommends -y \
	vsftpd \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 20 21

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]