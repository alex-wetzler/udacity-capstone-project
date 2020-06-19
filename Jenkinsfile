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
                 //aquaMicroscanner imageName: 'alpine:latest', notCompleted: 'exit 1', onDisallowed: 'fail'
                 aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
              }
         }
         stage('Build Docker Container') {
             steps {
                 sh './run_docker.sh'
             }
         }
         /*stage('Push Docker Image') {
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