#!/bin/bash

# Create the directory needed for mariadb and also give the ownership to mariadb/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# If mysql database not created in the volume then create the database
if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql 

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null

	mysql_secure_installation_script="
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	DROP USER ''@'localhost';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE test;
	FLUSH PRIVILEGES;
	"

	mysqld --user=mysql --bootstrap <<< $mysql_secure_installation_script
fi

# If the needed database (for wordpress) is not created then create it
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

	sqlcommands="
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
	"

	mysqld --user=mysql --bootstrap <<< $sqlcommands

fi

exec "$@"