resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidar
    tags = {
        Name = "myVpc"
    } 
}