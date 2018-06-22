output "subnet_id" {
  value       = "${aws_subnet.subnet.id}"
  description = "Private Subnet Id"
}

output "subnet_cidr" {
  value       = "${var.subnet_cidr}"
  description = "Private Subnet CIDR Mask"
}

output "admin_sg" {
  value       = "${aws_security_group.admin.id}"
  description = "This is a security group that is within the private subnet. Any instance that is assigned this security group will allow ssh traffic from any other instance that is assigned this security group"
}

output "nat_gateway" {
  value = "${aws_nat_gateway.nat_gw.id}"
}
