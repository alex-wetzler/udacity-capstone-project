# Udacity Capstone Projekt

This project was created as part of Udacity's Cloud DevOps Engineer Nanodegree program and operationalizes a microservice (simple Nginx application) utilzing Git, Ansible, Jenkins, Docker and Kubernetes alongside various services in the AWS cloud.

## Repository
- Name: udacity-capstone-project
- Author: Alex Wetzler
- Access level: public
- URL: https://github.com/alex-wetzler/udacity-capstone-project

## Files
- Dockerfile -> Instructions for assembling the Docker image
- Makefile -> Directives for set-up of environment and linting of Dockerfile
- README.md -> Description of project, repository, files and usage
- cd-job.yaml -> Ansible playbook for CD pipeline
- ci-job.yaml -> Ansible playbook for CI pipeline
- deployment.yaml -> Definition of Kubernetes deployment (used by CD pipeline)
- index.html -> HTML page for simple Nginx application
- inventory -> Inventory file with definition of host and connection details
- k8s-job.yaml -> Ansible playbook for K8s pipeline (set-up of Kubernetes cluster in AWS)
- service.yaml -> Definition of Kubernetes service (used by CD pipeline)

### Usage
1. Create and set-up an EC2 instance for deployment purposes
2. Install and configure Git, Ansible, Jenkins, AWS CLI, kubectl and kops
3. Create an IAM role with full access for services Route53, EC2, IAM and S3 and attach it to the EC2 instance
4. Create the Route53 private hosted zone "udacity.net" (this is necessary for spinning up the K8s cluster)
5. Create the pipeline "K8s-Job" in Jenkins for the set-up of the Kubernetes cluster with the shell build command "ansible-playbook -i inventory k8s-job.yaml"
6. Create the pipeline "CI-Job" in Jenkins for Continuous integration with the shell build command "ansible-playbook -i inventory ci-job.yaml", an SCM poll trigger and a post-build action for the CD-Job (s. next)
7. Create the pipeline "CD-Job" in Jenkins for Continuous Deployment with the shell build command "ansible-playbook -i inventory cd-job.yaml"
8. Execute the pipeline "K8s-Job" and verify the cluster is up and running with the command "kops validate cluster --name k8s.udacity.net --state s3://k8sconfig.udacity.net" (the cluster creation usually takes 5-10 minutes)
9. Execute the pipeline "CI-Job" and verify both pipelines ("CI-Job", "CD-Job") were executed successfully
10. Open inbound port 31300 for the security group of the K8s master node in the AWS console
11. The application should now be accessible through http://k8s-master-node-name:31300