FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
    apt install -y \
    vim \
    wget \
    mariadb-client && \
    apt-get install php7.4 -y && \
    apt-get install php-fpm -y && \
    apt-get install php-mysql -y && \
    mkdir -p /var/run/php && \
    mkdir -p /var/run/wordpress


# Install WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/config.sh /config.sh

RUN chmod 777 /config.sh

ENTRYPOINT ["/config.sh"]