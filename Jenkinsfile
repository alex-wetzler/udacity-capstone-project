pipeline {
    agent any
    stages {
        stage('Security Scan') {
            steps { 
                aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
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
        /*stage('Test Job') {
            steps {
                ansiblePlaybook playbook: 'main.yaml', inventory: 'inventory'
            }
        }*/
        stage('CI Job') {
            steps {
                ansiblePlaybook playbook: 'ci-job.yaml', inventory: 'inventory'
            }
        }
        stage('CD Job') {
            steps { 
                ansiblePlaybook playbook: 'cd-job.yaml', inventory: 'inventory'
            }
        }
    }
}