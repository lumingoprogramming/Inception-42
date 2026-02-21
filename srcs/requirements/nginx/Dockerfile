FROM debian:12
RUN apt-get update -y
RUN apt-get install nginx -y

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/script.sh"]
CMD ["nginx", "-g", "daemon off;"]
