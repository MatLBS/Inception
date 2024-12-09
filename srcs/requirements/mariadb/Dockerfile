FROM debian:bullseye

RUN apt-get update -y &&\
apt install mariadb-server -y

EXPOSE 3306

COPY conf/mariadb.conf /etc/mysql/mariadb.conf

CMD ["mariadbd", "-g", "daemon off;"]