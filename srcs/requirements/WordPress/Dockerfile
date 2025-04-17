FROM alpine:3.19

RUN apk update && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-openssl \
    php81-mbstring \
    php81-session \
    php81-phar \
    php81-iconv \
    curl \
    mariadb-client && \
    mkdir -p /run/php /var/www/html /var/log/php81 && \
    chmod 755 /var/log/php81 && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    echo "memory_limit = 512M" > /etc/php81/conf.d/memory.ini

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY tools/wp-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-setup.sh

WORKDIR /var/www/html
EXPOSE 9000

CMD ["/usr/local/bin/wp-setup.sh"] 