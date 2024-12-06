FROM debian:bullseye

RUN apt-get update -y &&\
apt install mariadb-server mariadb-client -y
# RUN systemctl enable mariadb
# RUN systemctl start mariadb
# RUN systemctl status mariadb

EXPOSE 3306

# LABEL version="1.0"
# LABEL description="MariaDB Server"

COPY conf/mariadb.conf /etc/mariadb/mariadb.conf

CMD ["mariadbd"]