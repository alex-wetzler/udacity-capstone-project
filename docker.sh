#!/usr/bin/env bash

# Retrieve an authentication token and authenticate Docker client to registry
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 731758322990.dkr.ecr.eu-central-1.amazonaws.com

# Build Docker image
docker build -t udacity-capstone-project .

# Tag Docker image
docker tag udacity-capstone-project:latest 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest

# List Docker images
docker image ls

# Push image to AWS repository
docker push 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest

# Run Docker container (detached mode)
docker run --rm -d -p 8081:80 --name udacity-capstone-project udacity-capstone-project

# List Docker containers
#docker container ls
#docker ps -a 

# Stop Docker container
#docker stop udacity-capstone-project

# Remove Docker container
#docker rm udacity-capstone-project

# Remove Docker image
#docker rmi udacity-capstone-project:latest