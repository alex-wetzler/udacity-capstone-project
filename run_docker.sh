#!/usr/bin/env bash

# Build image
docker build --tag=app .

# List docker images
docker image ls

# Run flask app
docker run -it app bash
#docker run -po 8000:5001 app
#docker run -it --rm --name my-running-app app

# Testing inside docker env
# uname
# python app.py