FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb mariadb-client && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    chmod 750 /var/lib/mysql && \
    chmod 755 /run/mysqld && \
    rm -rf /var/cache/apk/*

COPY conf/my.cnf /etc/my.cnf
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["/init.sh"]