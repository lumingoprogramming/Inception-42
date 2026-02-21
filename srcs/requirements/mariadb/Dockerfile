FROM debian:12
RUN apt-get update -y
RUN apt-get install mariadb-server -y

COPY scripts.sh /usr/local/bin/scripts.sh
RUN chmod +x /usr/local/bin/scripts.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/scripts.sh" ]
CMD [ "mysqld", "--user=root", "--bind-address=0.0.0.0", "--skip-networking=false", "--port=3306" ]
