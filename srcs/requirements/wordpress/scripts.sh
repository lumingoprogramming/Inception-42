#!/bin/sh
set -e

# Ensure WordPress is installed in /var/www/html
WP_PATH="/var/www/html"

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "WordPress not found, installing..."
    mkdir -p "$WP_PATH"
    cd "$WP_PATH"

    echo "Downloading WordPress..."
    wp core download --allow-root

    echo "Creating WordPress config..."
    wp config create --allow-root \
        --dbname="${MARIADB_WP_DB}" \
        --dbuser="${MARIADB_WP_ADMIN}" \
        --dbpass="$(cat /run/secrets/mariadb_wp_admin_password)" \
        --dbhost="${MARIADB_HOST}" \
        --skip-check

    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="https://${SITE_FQDN}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="$(cat /run/secrets/mariadb_wp_admin_password)" \
        --admin_email="${WP_ADMIN_EMAIL}"

    echo "Setting permissions..."
    chown -R www-data:www-data "$WP_PATH"

    echo "WordPress installed successfully!"
else
    echo "WordPress already installed, skipping..."
fi

# Start PHP-FPM in foreground
echo "Starting PHP-FPM..."
exec "$@"
