pipeline {
     agent any
     stages {
        stage('Security Scan') {
              steps { 
                 aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
              }
         }
         stage('CI-Job') {
              steps {
                  ansiblePlaybook playbook: 'ci-job.yaml', inventory: 'inventory'
              }
         }
         stage('CD-Job') {
              steps { 
                 ansiblePlaybook playbook: 'cd-job.yaml', inventory: 'inventory'
              }
         }
     }
}