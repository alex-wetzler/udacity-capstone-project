#!/usr/bin/env bash

dockerpath="alexwetzler/app"

# Run in Docker Hub container with kubernetes
kubectl run app\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=app

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward app 8081:80