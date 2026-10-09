FROM debian:bookworm
RUN apt-get update && apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY tools/init.sh /init.sh
COPY conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

ENTRYPOINT [ "sh", "/init.sh" ]
# CMD [ "mysql", "--user=mysql"]