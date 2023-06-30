FROM php:7.4.33-fpm-alpine3.16

ARG TZ=Asia/Shanghai
ARG CONTAINER_PACKAGE_URL=mirrors.ustc.edu.cn   

# 阿里镜像mirrors.aliyun.com

# https://github.com/mlocati/docker-php-extension-installer.git
COPY ./install-php-extensions  /usr/local/bin/install-php-extensions

RUN  sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

# Fix: https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv libstdc++ --no-cache --repository http://${CONTAINER_PACKAGE_URL}/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN chmod +x /usr/local/bin/install-php-extensions && \
    IPE_ICU_EN_ONLY=1 \
    install-php-extensions \
    mongodb pdo_mysql \
    mysqli \
    gd \
    opcache \
    swoole \
    zip \
    redis \
    memcached \
    pcntl \
    bcmath \
    rdkafka \
    grpc \
    @composer

# php image's www-data user uid & gid are 82, change them to 1000 (primary user)
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

# supervisor
RUN apk add supervisor && rm -rf /var/cache/apk/*

WORKDIR /www
