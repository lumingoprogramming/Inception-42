FROM debian:12
RUN apt-get update -y
RUN apt-get install php php-fpm php-mysql php-xml php-mbstring \
					php-curl php-zip php-gd php-imagick php-intl \ 
					php-soap php-xmlrpc php-cli php-common \
					php-opcache curl -y 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY scripts.sh /usr/local/bin/scripts.sh
COPY php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf
RUN chmod +x /usr/local/bin/scripts.sh

ENTRYPOINT [ "/usr/local/bin/scripts.sh" ]
CMD [ "php-fpm8.2", "-F" ]
