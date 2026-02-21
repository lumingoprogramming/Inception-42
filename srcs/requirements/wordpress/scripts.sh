#!/bin/sh

WP_ADMIN_PASS=$(cat /run/secrets/mariadb_wp_admin_password)

if [ ! -d /var/www/wordpress ]; then
  echo "Wordpress not found, installing..."
  mkdir -p /var/www
  cd /var/www
  echo "Downloading wordpress..."
  sleep 10
  wp core download --allow-root --path=wordpress
  echo "Creating config file..."
  cd wordpress
  wp config create --allow-root \
     --dbname="${MARIADB_WP_DB}" \
     --dbuser="${MARIADB_WP_ADMIN}" \
     --dbpass="${WP_ADMIN_PASS}" \
     --dbhost="${MARIADB_HOST}" \
     --skip-check
  echo "Setting owner..."
  echo "Installing wordpress..."
  wp core install --allow-root \
     --url="https://${SITE_FQDN}" \
     --title="${WP_TITLE}" \
     --admin_user="${WP_ADMIN_USER}" \
     --admin_password="${WP_ADMIN_PASS}" \
     --admin_email="${WP_ADMIN_EMAIL}"
  echo "Wordpress installed successfully!"
fi

echo "Starting PHP-FPM..."
exec "$@"