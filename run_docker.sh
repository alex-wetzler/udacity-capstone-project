#!/usr/bin/env bash
docker build -t my-nginx-app .
docker image ls
docker run --rm -p 8081:80 my-nginx-app

#docker run --rm -it -p 8081:80 my-nginx-app
#docker rmi <image>:<tag>
#curl localhost:8081