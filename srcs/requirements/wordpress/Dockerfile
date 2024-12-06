FROM debian:bullseye


RUN apt-get update && \
    apt install php vim curl -y && \
    mkdir -p /var/run/wordpress

COPY conf/wordpress.conf /etc/wordpress/wordpress.conf