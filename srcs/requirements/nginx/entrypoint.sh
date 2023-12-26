#!/bin/bash

# # Check if certificates already exist
# if [ ! -f /etc/nginx/ssl/wxuerui.42.fr.crt ] || [ ! -f /etc/nginx/ssl/wxuerui.42.fr.key ]; then
#     # Generate SSL certificates
#     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/wxuerui.42.fr.key -out /etc/nginx/ssl/wxuerui.42.fr.crt -subj "/C=MY/ST=Selangor/L=Kuala Lumpur/O=42KL/OU=wxuerui/CN=wxuerui.42.fr"
# fi

exec "$@"