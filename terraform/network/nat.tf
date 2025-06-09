resource "aws_eip" "eip" {
    domain = "vpc"
    tags = {
      Name = "ElasticIP"
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.subnets["Public-Subnet-1"].id
    tags = {
      Name = "NAT"
    }
    depends_on = [aws_eip.eip, aws_subnet.subnets["Public-Subnet-1"]]
}