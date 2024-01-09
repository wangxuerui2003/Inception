#!/bin/bash

# Only run this script if the ftp user does not exist
if ! grep "^$FTP_USER:" /etc/passwd &>/dev/null; then

	useradd -m $FTP_USER
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

	mkdir -p /var/run/vsftpd/empty

fi

exec "$@"