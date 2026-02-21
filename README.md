*This project has been created as part of the 42 curriculum by luguo.*

# Inception

## Description

This project builds a small containerized infrastructure using Docker Compose, aiming to deploy a secure and modular web stack composed of:

NGINX with TLSv1.2/1.3

WordPress with PHP-FPM

MariaDB database

Each service runs in its own container, built from a custom Dockerfile (Debian or Alpine). Persistent data uses Docker volumes, and sensitive credentials are handled via Docker secrets.

The project highlights container orchestration, service isolation, networking, and secure configuration in a reproducible environment. Key design choices include modularity, security, and portability.

Comparisons:

VMs vs Docker: Docker is lightweight, sharing the host OS, while VMs are heavier full OS instances.

Secrets vs Environment Variables: Secrets are encrypted and secure; environment variables are simpler but less secure.

Docker Network vs Host Network: Docker networks isolate containers; host network connects directly to the host.

Volumes vs Bind Mounts: Volumes are portable and managed by Docker; bind mounts link directly to host files.

---
## Instructions
To compile and run the Inception project, follow these steps:

Clone the repository:

git clone <repository_url>
cd inception

Build the project:
Ensure you have Docker installed. Then run:

docker-compose build

Start the services:

docker-compose up

This will launch all containers defined in the project.

Access the project:
Open your browser at http://localhost (or the configured port) to verify that the services are running.

Stop the project:

docker-compose down

Make sure to have all prerequisites installed: Docker, Docker Compose, and necessary system resources.

## Resources
Documentation:

Docker Official Docs
https://docs.docker.com/– for containerization and image management.

Docker Compose Docs
https://docs.docker.com/compose/– for orchestration of multi-container applications.

Articles/Tutorials:

“Docker for Beginners” – guides on containerizing applications.

42 school Inception project guidelines (internal resources).

AI Assistance:
AI tools were utilized to:

Suggest Docker configuration optimizations.

Provide guidance on common troubleshooting steps.