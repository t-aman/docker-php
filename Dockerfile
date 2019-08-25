# ベース
FROM php:7.3.8-apache-stretch

# SSL適用
RUN apt-get update \
    && apt-get install -y libssl-dev openssl ssl-cert \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod ssl \
    && a2ensite default-ssl

# ポート
EXPOSE 80 443

# セットアップ
COPY ./ /var/www/html/
