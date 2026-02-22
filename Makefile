SSL_KEY  = secrets/ssl_key.pem 
SSL_CERT = secrets/ssl_cert.pem
ROOT_PASS = secrets/root_pass
ADMIN_PASS = secrets/admin_pass
USER_PASS = secrets/user_pass

all: key data
	docker compose -f srcs/docker-compose.yml up --build

d: key
	docker compose -f srcs/docker-compose.yml up --build --detach

key: ${SSL_KEY} ${SSL_CERT} pass

pass: ${ROOT_PASS} ${ADMIN_PASS} ${USER_PASS}

data:
	mkdir -p $(HOME)/data/mariadb/
	mkdir -p $(HOME)/data/wordpress/

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker builder prune -af

fclean: clean
	sudo rm -rf ~/data/*
	rm -rf ${SSL_KEY} ${SSL_CERT} ${ROOT_PASS} ${ADMIN_PASS} ${USER_PASS}
	docker image rm -f inception-mariadb inception-wordpress inception-nginx
	docker volume rm -f mariadb_data wordpress_data
	docker network rm -f backend

${SSL_KEY} ${SSL_CERT}:
	openssl req -x509 -newkey rsa:4096 -keyout ${SSL_KEY} -out ${SSL_CERT} -sha256 -days 365 -nodes -subj \
	"/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

${ROOT_PASS}: 
	openssl rand -base64 16 > ${ROOT_PASS}

${ADMIN_PASS}:
	openssl rand -base64 16 > ${ADMIN_PASS}

${USER_PASS}:
	openssl rand -base64 16 > ${USER_PASS}

re: fclean all

.PHONY: all re clean key
