resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public-RT"
  }
}
resource "aws_route_table_association" "public_subnet_1_assoc" {
    subnet_id = aws_subnet.subnets["Public-Subnet-1"].id
    route_table_id = aws_route_table.Public-RT.id
}

resource "aws_route_table_association" "public_subnet_2_assoc" {
    subnet_id = aws_subnet.subnets["Public-Subnet-2"].id
    route_table_id = aws_route_table.Public-RT.id
}

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Private-RT"
  }
}
resource "aws_route_table_association" "private_subnet_1_assoc" {
    subnet_id = aws_subnet.subnets["Private-Subnet-1"].id
    route_table_id = aws_route_table.Private-RT.id
}
resource "aws_route_table_association" "private_subnet_2_assoc" {
    subnet_id = aws_subnet.subnets["Private-Subnet-2"].id
    route_table_id = aws_route_table.Private-RT.id
}