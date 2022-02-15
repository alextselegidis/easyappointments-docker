#!/usr/bin/env sh
set -eu

if [ ! -f /var/www/html/config.php ]; then
    envsubst < /var/www/html/config-docker.php > /var/www/html/config.php
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php "$@"
fi

exec "$@"