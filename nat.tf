resource "aws_eip" "nat_eip" {
  vpc  = true
  tags = "${merge(map("Name", "${var.network_name}-private"), var.resource_tags)}"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.subnet.id}"
  tags          = "${merge(map("Name", "${var.network_name}-private"), var.resource_tags)}"
}

# for each of the private ranges, create a "private" route table.
resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(map("Name", "${var.network_name}-private"), var.resource_tags)}"
}

# add a nat gateway to each private subnet's route table
resource "aws_route" "private_nat_gateway_route" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "${var.private_subnet_egress_cidr_block}"
  depends_on             = ["aws_route_table.private"]
  nat_gateway_id         = "${aws_nat_gateway.nat_gw.id}"
}

resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.private.id}"
}
