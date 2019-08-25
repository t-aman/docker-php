# ベース
FROM php:7.3.8-apache-stretch

# 環境変数
ENV WWWROOT="/var/www/html/"

# ポート
EXPOSE 80

# セットアップ
COPY ./ $WWWROOT
