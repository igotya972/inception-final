FROM alpine:3.19

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx /etc/nginx/ssl /var/www/html

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=IDF/L=Nice/O=42/CN=dferjul.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]