variable region {
    type = string
    default = "us-east-1"  
}
variable profile {
    type = string
    default = "malak-terraform"
}
variable instance_type {
    type = string
    default = "t2.micro"
    description = "The size of the EC2 instance"
}
variable vpc_cidar {
    type = string
}
variable "subnets_list" {
    type = list(object(
    {
        name=string,
        cidr=string,
        az=string,
        type=string
    }
    )) 
}
variable "instance_ami" {
  type        = string
  description = "The AMI of the EC2 instance"
}
variable "instance_key_pair" {
    type = string
    description = "The keypair name to access the EC2 instances"
}
variable "instance_names" {
    type = list(string)
   default = ["Jenkins", "Ansible", "Nodejs-app1", "Nodejs-app2"]
    description = "The name of the EC2 instance"
}
variable "instance_user_data" {
  type = map(string)
  description = "Map of instance names to their user_data scripts"
  default = {
    Jenkins = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y java-1.8.0-openjdk-devel
    sudo yum install -y git
    sudo yum install -y wget
    wget -O /tmp/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war
    sudo java -jar /tmp/jenkins.war --httpPort=8080 &
    EOF
    Ansible = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y ansible
    EOF
    Nodejs-app1 = <<-EOF
    #!/bin/bash
    sudo yum update -y
    EOF
    Nodejs-app2 = <<-EOF
    #!/bin/bash
    sudo yum update -y
    EOF
  }
}
/*variable "vpc_id" {
    type        = string
    description = "The ID of the VPC"
}*/
/*variable "aws_security_group" {
    type = map(object({
        id   = string,
        name = string
    }))
    description = "Map of security groups with their IDs and names"
}*/
/*variable "subnets_list" {
    type = map(object({
        id   = string,
        name = string,
        cidr = string,
        az   = string,
        type = string
    }))
    description = "Map of subnets with their IDs, names, CIDRs, availability zones, and types"
}*/
/*variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
}*/
