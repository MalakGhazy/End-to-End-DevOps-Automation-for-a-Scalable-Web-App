resource "aws_key_pair" "ssh_key" {
    key_name = var.instance_key_pair
    public_key = file("~/.ssh/id_ed25519.pub") 
}

resource "aws_instance" "ec2" {
  for_each = toset(var.instance_names)
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.instance_key_pair
  # Select the correct subnet for each instance by name
  subnet_id     = lookup({
    Jenkins      = var.subnets_list["Public-Subnet-1"]
    Ansible      = var.subnets_list["Public-Subnet-2"]
    Nodejs-app1  = var.subnets_list["Private-Subnet-1"]
    Nodejs-app2  = var.subnets_list["Private-Subnet-2"]
  }, each.key, null)
  # Select the correct security group for each instance by name
  vpc_security_group_ids = lookup({
    Jenkins      = [var.aws_security_group["Public-SG"]]
    Ansible      = [var.aws_security_group["Public-SG"]]
    Nodejs-app1  = [var.aws_security_group["Private-SG"]]
    Nodejs-app2  = [var.aws_security_group["Private-SG"]]
  }, each.key, [])
  tags = {
    Name = each.key
  }
  user_data = var.instance_user_data[each.key]
}