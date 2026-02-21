## Environment Setup

Prerequisites: Docker, Docker Compose, Make

Clone repo:

git clone <repository_url>
cd inception

Configuration & secrets:

.env for environment variables

docker-compose.yml defines services

Docker secrets in secrets/

docker secret create db_password secrets/db_password.txt

## Build & Launch
make build      # Build containers
make up         # Start services
make down       # Stop and clean

Or use directly:

docker-compose build
docker-compose up -d
docker-compose down

## Manage Containers & Volumes
docker ps                       # List running containers
docker logs <container_name>    # View logs
docker volume ls                # List volumes
docker volume inspect <volume_name>  # Inspect data
docker container prune          # Remove stopped containers
docker volume prune             # Remove unused volumes

## Data Persistence

Volumes used:

db_data → MariaDB

wp_data → WordPress uploads

Volumes keep data intact even after container rebuilds.