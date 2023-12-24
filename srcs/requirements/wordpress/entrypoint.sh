#!/bin/bash

# If no wordpress file, download and configure the wp-config.php file
if [ ! -e "./wp-config.php" ]; then    

	# Get wordpress files
	curl -k https://wordpress.org/latest.tar.gz | tar zx --strip-components=1 -C .

	# Configure database connection credentials
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" wp-config-sample.php
	sed -i "s/username_here/$WORDPRESS_DB_USER/" wp-config-sample.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" wp-config-sample.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/" wp-config-sample.php

	# Generate the random salts for security in wordpress
	awk '
		/put your unique phrase here/ {
			cmd = "head -c1m /dev/urandom | sha1sum | cut -d\\  -f1"
			cmd | getline str
			close(cmd)
			gsub("put your unique phrase here", str)
		}
		{ print }
	' wp-config-sample.php > wp-config.php

	rm wp-config-sample.php

	chown -R www-data:www-data .
fi

mkdir -p /run/php

exec "$@"