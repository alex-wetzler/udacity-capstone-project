pipeline {
     agent any
     stages {
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Security Scan') {
              steps { 
                 aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
              }
         }
         stage('Build Docker') {
              steps { 
                 sh 'docker build -t udacity-capstone-project .'
              }
         }
        stage('Run Docker') {
              steps { 
                 sh 'docker run --rm -d -p 8081:80 --name udacity-capstone-project udacity-capstone-project'
              }
         }
         stage('AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'Jenkins', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh """
                    mkdir -p ~/.aws
                    echo "[default]" > ~/.aws/credentials
                    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
                    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials
                """
                }
            }
         }
         stage('Push to ECR') {
              steps { 
                 sh 'docker tag udacity-capstone-project:latest 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest'
                 sh 'docker push 731758322990.dkr.ecr.eu-central-1.amazonaws.com/udacity-capstone-project:latest'
              }
         }
         /*stage('Test') {
              steps {
                sh """
                    cd ~
                    whoami
                    aws configure list
                    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 731758322990.dkr.ecr.eu-central-1.amazonaws.com
                """
              }
         }
         stage('Build, Run & Push Docker Container') {
             steps {
                 sh './docker.sh'
             }
         }
         stage('Push Docker Image') {
             steps {
                 sh './push_docker.sh'
             }
         }
         stage('AWS Credentials') {
            step {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'Jenkins', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh """
                    mkdir -p ~/.aws
                    echo "[default]" >~/.aws/credentials
                    echo "[default]" >~/.boto
                    echo "aws_access_key_id" = ${AWS_ACCESS_KEY_ID}" >>~/.boto
                    echo "aws_secret_access_key" = ${AWS_SECRET_ACCESS_KEY}" >>~/.boto
                    echo "aws_access_key_id" = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
                    echo "aws_secret_access_key" = ${AWS_SECRET_ACCESS_KEY}" >>~/.aws/credentials
                """
                }
            }
         }
         stage('Create EC2 Instance') {
            steps {
                ansiblePlaybook playbook: 'main.yaml', inventory: 'inventory'
            }
         }
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-east-2',credentials:'aws-static') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'static-jenkins-pipeline')
                  }
              }
         }*/
     }
}