output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnets_list" {
  value = {
    description = "Map of subnet names to their IDs"
    "Public-Subnet-1"  = aws_subnet.subnets["Public-Subnet-1"].id
    "Public-Subnet-2"  = aws_subnet.subnets["Public-Subnet-2"].id
    "Private-Subnet-1" = aws_subnet.subnets["Private-Subnet-1"].id
    "Private-Subnet-2" = aws_subnet.subnets["Private-Subnet-2"].id
  }
}

output "aws_security_group" {
    description = "Map of security group names to their IDs"
  value = {
    "Public-SG"  = aws_security_group.bastion_sg.id
    "Private-SG" = aws_security_group.App_SG.id
  }
}