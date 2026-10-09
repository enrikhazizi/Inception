FROM debian:bookworm
RUN apt-get update && apt-get install php default-mysql-client php-mysql php-curl \
    php-gd php-xml php-mbstring php-zip php-intl php-fpm curl -y &&\
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar &&\
    mv wp-cli.phar /usr/local/bin/wp &&\
    rm -rf /var/lib/apt/lists/*

COPY tools/init.sh /init.sh
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "sh", "/init.sh" ]