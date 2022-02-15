FROM php:7.4-apache-bullseye as builder

USER root

ENV APP_VERSION=latest

RUN apt update; apt install -y jq unzip;

RUN download_url=$(curl -s -L "https://api.github.com/repos/alextselegidis/easyappointments/releases/latest" | \
    jq -r '.assets[0].browser_download_url'); \
    curl -s -L ${download_url} -o easyappointments.zip; unzip easyappointments.zip -d /code


FROM php:7.4-apache-bullseye

COPY --chown=www-data:www-data --from=builder /code/ /var/www/html

COPY src/config-docker.php /var/www/html/config-docker.php

COPY src/docker-entrypoint.sh /

RUN docker-php-ext-install mysqli; \ 
    chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2-foreground"]