#!/bin/bash

sleep 10

cd /var/www/wordpress
if [ ! -f ./wp-config.php ]
then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
fi

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --locale=fr_FR --skip-email --allow-root

if ! wp user get $WP_USER --allow-root > /dev/null 2>&1
then
    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWD --allow-root --porcelain
fi

php-fpm7.3 -F;