# End-to-End-DevOps-Automation-for-a-Scalable-Web-App
A simulation project for deploying a scalable Node.js app on AWS using Terraform for infrastructure, Ansible for configuration, and Jenkins for CI/CD automation. 
🚀 Key Features
Terraform: Infrastructure as Code to provision AWS resources including VPC, EC2, Load Balancer, and S3 backend.

Ansible: Automated configuration of EC2 instances (Node.js, MongoDB, PM2) using reusable playbooks and dynamic inventory.

Jenkins CI/CD: Full CI/CD pipeline that automates testing, deployment, and updates on code changes pushed to GitHub.

AWS Services: S3 (for Terraform state), EC2, ALB, IAM, and CloudWatch for monitoring and logging.

🧱 Architecture Overview
VPC with public/private subnets

Bastion Host for secure SSH access

App Servers running Node.js behind an ALB

MongoDB Server in a private subnet

S3 for Terraform backend with versioning and state locking

Jenkins automating deployment through Bastion

CloudWatch (or Prometheus) for monitoring

📂 Repository Structure
devops-project/
├── terraform/       # Infrastructure code
├── ansible/         # Configuration management playbooks
├── jenkins/         # Jenkinsfile and pipeline setup
├── app/             # Sample Node.js app
└── README.md        # Setup guide and documentation

📘 Use Case
This repository is designed for intermediate DevOps learners looking to practice and understand:

Multi-tier cloud architecture

Complete DevOps pipelines

Infrastructure provisioning and state management

Automating configuration and deployment

Secure access and monitoring practices
