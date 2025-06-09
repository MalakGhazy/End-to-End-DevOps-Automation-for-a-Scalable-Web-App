resource "aws_security_group" "bastion_sg" {
    name = "bastion-sg"
    description = "Allow SSH"
    vpc_id = aws_vpc.myvpc.id

    #Inbound 
    ingress {
        description = "Allow SSH From Anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #Outbound
    egress {
        description = "Allow All Outbound Traffic"
        from_port = 0
        to_port = 0
        protocol = "-1" #Allow All Outbounds Traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "bastion-sg"
  }
}

resource "aws_security_group" "App_SG" {
    name = "App-SG"
    description = "Private Security Group - For App - Allow SSh & Port 3000 From Vpc CIDR"
    vpc_id = aws_vpc.myvpc.id
    #Inbound
    ingress {
        description = "Allow SSH From Anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        #cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.bastion_sg.id] #Allow SSH From Bastion Host
    }

    ingress {
        description = "Allow 3000 From VPC CIDR"
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        #cidr_blocks = [aws_vpc.myvpc.cidr_block]
        security_groups = [aws_security_group.Alb_SG.id] #Allow 3000 From ALB Security Group
    }
    #Outbound
    egress {
        description = "Allow All Outbound Traffic"
        from_port = 0
        to_port = 0
        protocol = "-1" #Allow All Outbounds Traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "App_SG"
    }
}

resource "aws_security_group" "Alb_SG"{
    name = "Alb-SG"
    description = "Allow Inbound HTTP"
    vpc_id = aws_vpc.myvpc.id
    #Inbound
    ingress {
        description = "Allow HTTP From Internet"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #Outbound
    egress {
        description = "Allow All Outbound Traffic"
        from_port = 0
        to_port = 0
        protocol = "-1" #Allow All Outbounds Traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
     tags = {
    Name = "Alb-SG"
  }
}

# Security Group - Database 