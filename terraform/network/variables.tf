variable "region" {
    type = string
}

variable "vpc_cidar" {
    type = string
}

variable "subnets_list" {
    type = list(object({
      name = string
      cidr = string
      az = string
      type = string
    }))
    description = "List of subnets with their Names,CIDRs & types"
}