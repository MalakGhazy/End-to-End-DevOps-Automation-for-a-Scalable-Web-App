module "mynetwork" {
    source = "./network"
    vpc_cidar = var.vpc_cidar
    region = var.region
    subnets_list = var.subnets_list
}
module "myec2" {
    source            = "./EC2"
    instance_names     = var.instance_names
    instance_ami      = var.instance_ami
    instance_key_pair = var.instance_key_pair
    instance_user_data = var.instance_user_data
    subnets_list         = module.mynetwork.subnets_list
    aws_security_group   = module.mynetwork.aws_security_group
}
module "myalb" {
  source            = "./ALB"
  vpc_id            = module.mynetwork.vpc_id
  public_subnet_ids = [
    module.mynetwork.subnets_list["Public-Subnet-1"],
    module.mynetwork.subnets_list["Public-Subnet-2"]
  ]
  security_group_id = module.mynetwork.aws_security_group["Public-SG"]
  instance_ids = { for name, id in module.myec2.instance_ids : name => id if contains(["Nodejs-app1", "Nodejs-app2"], name) }
}