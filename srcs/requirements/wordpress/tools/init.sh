#!/bin/bash
db_pass=$(cat /run/secrets/db_password | tr -d '\n')
wp_pass=$(cat /run/secrets/wp_admin_pass | tr -d '\n')
wp_user_pass=$(cat /run/secrets/wp_user_pass | tr -d '\n')
# Watey for Maria(and JANE)
until mysqladmin ping -h "${WP_DB_HOST}" -u "${MYSQL_USER}" -p"${db_pass}" --silent; do
    sleep 1
done

if [ ! -f "/var/www/html/wp-config.php" ]; then
    #downlaod core wordpress files
    wp core download --path="/var/www/html" --allow-root

    #configure the fuck out them
    wp config create --path="/var/www/html" --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${db_pass} --dbhost=${WP_DB_HOST} --allow-root

    # install wp with wp-cli 
    wp core install --path="/var/www/html" --url=${DOMAIN_NAME} --title=${DOMAIN_NAME} --admin_user=${ADMIN_WP} --admin_password=${wp_pass} --admin_email=${ADMIN_email} --allow-root

    #create users
    wp user create --path="/var/www/html"  ${WP_USER} ${WP_USER_EMAIL} --user_pass=${wp_user_pass} --role=subscriber --allow-root
fi

#start the engine
exec php-fpm8.2 -F