# Use Debian 12 as base
FROM debian:12

# Install PHP 8.2 and required extensions
RUN apt-get update -y && apt-get install -y \
    php8.2 php8.2-fpm php8.2-mysql php8.2-xml php8.2-mbstring \
    php8.2-curl php8.2-zip php8.2-gd php8.2-imagick php8.2-intl \
    php8.2-soap php8.2-xmlrpc php8.2-cli php8.2-common php8.2-opcache \
    curl unzip wget vim less \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy scripts and PHP-FPM configuration
COPY scripts.sh /usr/local/bin/scripts.sh
COPY php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf
RUN chmod +x /usr/local/bin/scripts.sh

# Expose PHP-FPM port
EXPOSE 9000

# Entrypoint runs our install script
ENTRYPOINT ["/usr/local/bin/scripts.sh"]

# CMD passed as $@ to scripts.sh
CMD ["php-fpm8.2", "-F"]
