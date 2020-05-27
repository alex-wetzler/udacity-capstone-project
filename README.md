[![CircleCI](https://circleci.com/gh/alex-wetzler/ml-microservices-api.svg?style=svg)](https://circleci.com/gh/alex-wetzler/ml-microservices-apii)

# ml-microservices-api

> Udacity Project: Operationalize a Machine Learning Microservice API

**This project operationalizes a working, machine learning microservice (Python flask app doing housing price prediction) using Kubernetes. Provided was a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on the data source site. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.**

> Instructions for usage

- ./run_docker.sh	-> runs the containerized Docker image
- ./run_kubernetes.sh	-> runs the Docker Hub container with Kubernetes
- ./make_prediction.sh 	-> makes API call to Machine Learning Microservice 

> Explanation of files
- app.py 		-> Python flask app
- Dockerfile 		-> Instructions for assembling an image
- docker_out.txt	-> Output of Docker image run test
- kubernetes.out.txt	-> Output of Docker Hub container run test
- Makefile		-> Directives for installing dependencies, testing & linting
- make_prediction.sh	-> s. instructions section
- requirements.txt	-> dependencies/libraries for Python flask app
- run_docker.sh		-> s. instructions section
- run_kubernetes.sh	-> s. instructions section
- upload_docker.sh	-> uploading image to Docker Hub
