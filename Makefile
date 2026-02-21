
NAME = inception

.PHONY: all build up down clean restart fclean

# Build images and start containers
all: build up

# Build all docker images without cache
build:
	docker compose -f srcs/docker-compose.yml build --no-cache

# Start containers in detached mode
up:
	docker compose -f srcs/docker-compose.yml up -d

# Stop containers, keep volumes
down:
	docker compose -f srcs/docker-compose.yml down

# Stop and remove containers + volumes (reset DB & WordPress)
clean:
	docker compose -f srcs/docker-compose.yml down -v

# Restart containers
restart: down up

# Remove containers and images (fully clean)
fclean: clean
	docker compose -f srcs/docker-compose.yml rm -f
