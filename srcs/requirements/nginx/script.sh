#!/bin/bash

cat > /etc/nginx/nginx.conf << EOF

events {
	worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log	stderr;
    error_log	stderr;

    server_tokens off;

    ssl_protocols TLSv1.2 TLSv1.3;

    server {
        listen 443 ssl;
        server_name ${SITE_FQDN};

		ssl_certificate		/run/secrets/ssl_cert;
		ssl_certificate_key	/run/secrets/ssl_key;

        root /var/www/wordpress;
        index index.php index.html index.htm;

        error_page 404 /404.html;
        location = /404.html {
            root /usr/share/nginx/html;
        }

        location / {
            try_files \$uri \$uri/ /index.php?\$args;
        }

        location ~ \.php$ {
            include fastcgi.conf;
            fastcgi_pass ${WORDPRESS_HOST}:9000;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            include fastcgi_params;
        }

        location ~ /\. {
            deny all;
        }
    }
}

EOF

exec "$@"
