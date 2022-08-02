#!/bin/bash
echo "Simple Shell script to clean/remove all container/images"

echo "The script will 
  - start services docker and docker.socket
  - first stop all running containers (if any),
  - remove containers
  - remove images
  - remove volumes"

echo "Start services"
sudo systemctl start docker docker.socket

echo "Stopping running containers (if available)"
docker stop $(docker ps -aq)

echo "Removing containers..."
docker rm $(docker ps -aq)

echo "Removing images"
docker rmi $(docker images -q)

echo "Removing docker container volumes (if any)"
docker volume rm $(docker volume ls -q)
