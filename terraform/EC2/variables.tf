variable "instance_type" {
    type = string
    description = "The size of the EC2 instances"
    default = "t2.micro"
}
variable "instance_names" {
    type = list(string)
   default = ["Jenkins", "Ansible", "Nodejs-app1", "Nodejs-app2"]
    description = "The name of the EC2 instance"
}
variable "instance_user_data" {
  type        = map(string)
  description = "Map of instance names to their user_data scripts"
  # You can set a default here, or leave it empty to use the module's default
}
variable "instance_ami" {
    type = string
    description = "The AMI of the EC2 instance"
}
variable "instance_key_pair" {
    type = string
    description = "vThe keypair name to access the EC2 instances"
}
variable "subnets_list" {
  type = map(string)
  description = "Map of subnet names to subnet IDs"
}
variable "aws_security_group" {
  type = map(string)
  description = "Map of security group names to IDs"
}

