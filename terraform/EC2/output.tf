output "instance_public_ips" {
  value = { for name, instance in aws_instance.ec2 : name => instance.public_ip }
}

output "instance_private_ips" {
  value = { for name, instance in aws_instance.ec2 : name => instance.private_ip }
}

output "instance_ids" {
  value = { for name, instance in aws_instance.ec2 : name => instance.id }
}
output "instance_names" {
  description = "Names of the EC2 instances"
  value = [for name in keys(aws_instance.ec2) : name]
}
output "instances" {
  description = "Full EC2 instance objects"
  value = aws_instance.ec2
}