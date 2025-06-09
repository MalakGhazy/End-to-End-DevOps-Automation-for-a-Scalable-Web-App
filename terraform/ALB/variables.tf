variable "vpc_id" {
  type = string
  description = "VPC ID where the ALB and target group will be created"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet IDs for the ALB"
}

variable "security_group_id" {
    type        = string
  description = "ID of the security group for the ALB"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
  default     = "nodejs-target-group"
}

variable "target_port" {
    type        = number
    description = "Port for the target group"
    default = 3000
}

variable "listener_port" {
    type        = number
    description = "Port for the ALB listener"
    default = 80
}

variable "instance_ids" {
    type = map(string)
    description = "Map of instance names to instance IDs"
}