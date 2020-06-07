#!/usr/bin/env bash

# Build image
docker build --tag=app .

# List docker images
docker image ls

# Run flask app
docker run -it app bash

# Testing inside docker env
# uname
# python app.py