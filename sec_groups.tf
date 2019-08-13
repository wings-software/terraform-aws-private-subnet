resource "aws_security_group" "admin" {
  name   = "${aws_subnet.subnet.id}-subnet-admin"
  vpc_id = "${var.vpc_id}"
  tags = "${var.resource_tags}"
}

resource "aws_security_group_rule" "ssh_all_in_subnet" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  self = true
  security_group_id = "${aws_security_group.admin.id}"
}
