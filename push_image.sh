#!/usr/bin/env bash

# Retrieve an authentication token and authenticate Docker client to registry
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 731758322990.dkr.ecr.eu-central-1.amazonaws.com

# Build Docker image
docker build -t udacity-capstone-project .

# Tag Docker image
docker tag udacity-capstone-project:latest 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest

# Push image to AWS repository
docker push 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest