FROM 7.3.10-apache

ENV WWWROOT_DIR /app/public

RUN apt-get update \
    && apt-get install -y \
        libmcrypt-dev \
        libz-dev \
        git \
        wget \
        libpcre3-dev \
    && docker-php-ext-install \
        mbstring \
        pdo_mysql \
        zip \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable mcrypt \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
# 开启 URL 重写模块
# 配置默认放置 App 的目录
RUN a2enmod rewrite \
    && mkdir -p /app \
    && rm -fr /var/www/html \
    && ln -s WWWROOT_DIR /var/www/html

WORKDIR /app

EXPOSE 80