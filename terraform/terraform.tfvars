vpc_cidar = "10.0.0.0/16"
region = "us-east-1"
instance_type = "t2.micro"
subnets_list = [ 
{
    name = "Public-Subnet-1",
    cidr = "10.0.1.0/24"
    az = "us-east-1a"
    type = "public"
},
{
    name = "Public-Subnet-2",
    cidr = "10.0.3.0/24"
    az = "us-east-1b"
    type = "public"
},
{
    name = "Private-Subnet-1",
    cidr = "10.0.2.0/24"
    az = "us-east-1a"
    type = "private"
},
{
    name = "Private-Subnet-2",
    cidr = "10.0.4.0/24"
    az = "us-east-1b"
    type = "private"
} 
]

instance_ami = "ami-084568db4383264d4"
instance_key_pair = "nodes-key"

