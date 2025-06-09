variable "table_name" {
  type        = string
  description = "The name of the DynamoDB table"
}

variable "hash_key" {
  type        = string
  description = "The hash key for the DynamoDB table"
}

variable "environment" {
    type        = string
    description = "The environment for the DynamoDB table"
    default     = "dev"
}

variable "project" {   
    type        = string
    description = "The project name for the DynamoDB table"
    default     = "employee-management"
}