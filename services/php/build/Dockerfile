FROM php:7.4.33-fpm-alpine3.16

# https://github.com/mlocati/docker-php-extension-installer.git
COPY ./install-php-extensions  /usr/local/bin/install-php-extensions

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo_mysql mysqli mbstring gd curl opcache swoole zip redis memcached pcntl bcmath mongodb rdkafka xdebug grpc

RUN install-php-extensions @composer
# php image's www-data user uid & gid are 82, change them to 1000 (primary user)
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

# supervisor
RUN apk add supervisor \
	&& rm -rf /var/cache/apk/*


WORKDIR /www
