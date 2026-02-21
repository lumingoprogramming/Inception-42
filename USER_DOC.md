## Services Provided

NGINX – secure web server (TLS)

WordPress – website platform (PHP-FPM)

MariaDB – database for WordPress

## Start / Stop the Project
docker-compose up -d    # Start all services
docker-compose down     # Stop all services
## Access

Website: http://localhost

WordPress Admin: http://localhost/wp-admin

## Credentials

Stored as Docker secrets

List and inspect:

docker secret ls
docker secret inspect <secret_name>

## Check Services

Running containers:

docker ps

Logs for a service:

docker logs <container_name>

Ensure NGINX, WordPress, and MariaDB containers are active and healthy.