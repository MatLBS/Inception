FROM debian:bullseye


RUN apt-get update
RUN    apt-get -y install wget
RUN    apt-get install php7.3 -y
RUN    apt-get install php-fpm -y
RUN    apt-get install php-mysql -y
# RUN    apt-get mariadb-client -y
RUN    mkdir -p /var/run/wordpress

 #  vim curl -y && \

EXPOSe 9000

COPY conf/wordpress.conf /etc/wordpress/wordpress.conf

CMD ["wordpress", "-g", "daemon off;"]