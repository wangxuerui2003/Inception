#!/bin/bash

php-fpm7.3 -D

exec "$@"