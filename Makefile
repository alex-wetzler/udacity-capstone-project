setup:
	python3 -m venv ~/.udacity-capstone-project
	#source ~/.udacity-capstone-project/bin/activate
	#alias venv-ucp="cd ~/environment/udacity-capstone-project && source ~/.udacity-capstone-project/bin/activate" 

lint:
	#wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64 && chmod +x /bin/hadolint
	hadolint Dockerfile

all: setup lint