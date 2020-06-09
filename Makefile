setup:
	python3 -m venv ~/.udacity-capstone-project
	#source ~/.udacity-capstone-project/bin/activate
	#alias venv-ucp="cd ~/environment/udacity-capstone-project && source ~/.udacity-capstone-project/bin/activate" 

install:
	#wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64 && chmod +x /bin/hadolint
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
    # See https://circleci.com/docs/2.0/local-cli/#processing-a-config
    #circleci config process .circleci/config.yml

run-circleci-local:
    # See https://circleci.com/docs/2.0/local-cli/#running-a-job
    #circleci local execute

lint:
	hadolint Dockerfile
	#pylint --disable=R,C,W1203 app.py
	pylint --disable=R,C,W1309,W1203,W1202 app.py

all: install lint test