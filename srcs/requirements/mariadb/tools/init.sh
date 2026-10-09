#!/bin/sh

MYSQL_PASSWORD=$(cat /run/secrets/db_password | tr -d '\n')
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password | tr -d '\n')

mysqld_safe &

# and Jane
until mysqladmin ping --silent; do
    echo "OMG it's Jane Juliet"
    sleep 1
done

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
fi
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
exec mysqld --user=mysql