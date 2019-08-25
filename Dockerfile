# ベース
FROM php:7.3.8-apache-stretch

# SSL適用
RUN apt-get update \
    && apt-get install -y libssl-dev openssl ssl-cert \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod ssl \
    && a2ensite default-ssl \
    && docker-php-ext-install pdo_mysql

# php.ini設定
ENV PHPINI=/usr/local/etc/php/php.ini
RUN cp /usr/local/etc/php/php.ini-development $PHPINI
RUN sed -ri 's/;date.timezone =/date.timezone = Asia\/Tokyo/' $PHPINI && \
    sed -ri 's/display_errors = Off/display_errors = On/' $PHPINI && \
    sed -ri 's/post_max_size = 8M/post_max_size = 100M/' $PHPINI && \
    sed -ri 's/upload_max_filesize = 2M/upload_max_filesize = 100M/' $PHPINI && \
    sed -ri 's/;mbstring.language = Japanese/mbstring.language = Japanese/' $PHPINI && \
    sed -ri 's/;mbstring.internal_encoding = EUC-JP/mbstring.internal_encoding = UTF-8/' $PHPINI && \
    sed -ri 's/;mbstring.http_input = auto/mbstring.http_input = pass/' $PHPINI && \
    sed -ri 's/;mbstring.http_output = SJIS/mbstring.http_output = pass/' $PHPINI && \
    sed -ri 's/;mbstring.encoding_translation = Off/mbstring.encoding_translation = Off/' $PHPINI

# ポート
EXPOSE 80 443

# セットアップ
COPY ./ /var/www/html/
