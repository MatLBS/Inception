FROM debian:bullseye

EXPOSE 443

RUN apt-get update && \
    apt install nginx vim curl -y && \
    mkdir -p /etc/nginx/ssl && \
    apt-get install openssl -y && \
    openssl req -x509 -new -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR" && \
    mkdir -p /var/run/nginx && \
    chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]