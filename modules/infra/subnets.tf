resource "aws_subnet" "pub_subnet_1" {
  vpc_id     = aws_vpc.devops_vpc.id
  availability_zone = var.az1
  cidr_block = var.pub_subnet_1_cidr
  map_public_ip_on_launch = true
  #Enable auto-assign public IPv4 address

  tags = {
    Name = var.pub_subnet_1_name
  }
}

resource "aws_subnet" "pub_subnet_2" {
  vpc_id     = aws_vpc.devops_vpc.id
  availability_zone = var.az2
  cidr_block = var.pub_subnet_2_cidr
  map_public_ip_on_launch = true
  #Enable auto-assign public IPv4 address

  tags = {
    Name = var.pub_subnet_2_name
  }
}