#!/bin/bash

sleep 10

cd /var/www/wordpress

chown -R www-data:www-data /var/www/wordpress
chmod -R 777 /var/www/wordpress

if [ ! -f ./wp-config.php ]
then
    wp core download --allow-root
    wp config create \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST \
        --allow-root
fi

wp core install \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWD \
    --admin_email=$WP_ADMIN_MAIL \
    --locale=fr_FR \
    --skip-email \
    --allow-root

if ! wp user get $WP_USER --allow-root > /dev/null 2>&1; then   
    wp user create > /dev/null 2>&1 \
        $WP_USER \
        $WP_USER_MAIL \
        --user_pass=$WP_USER_PASSWD \
        --allow-root \
        --porcelain
fi

wp config set WP_REDIS_HOST 'redis' --raw --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE true --raw --allow-root

apt-get install php-redis -y

if ! wp plugin get redis-cache --allow-root > /dev/null 2>&1; then  
    wp plugin install redis-cache --activate --allow-root
fi

wp redis enable --allow-root

php-fpm7.4 -F;