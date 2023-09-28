resource "aws_route_table" "pub_rtr_1" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = var.pub_rt_name
  }
}

resource "aws_route_table_association" "pub-sub_1-assoc" {
  subnet_id      = aws_subnet.pub_subnet_1.id
  route_table_id = aws_route_table.pub_rtr_1.id
}

resource "aws_route_table_association" "pub-sub_2-assoc" {
  subnet_id      = aws_subnet.pub_subnet_2.id
  route_table_id = aws_route_table.pub_rtr_1.id
}

resource "aws_route" "pub_routes" {
  route_table_id            = aws_route_table.pub_rtr_1.id
  destination_cidr_block    = var.def_routes
  gateway_id = aws_internet_gateway.devops_igw.id
}