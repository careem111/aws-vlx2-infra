resource "aws_vpc" "devops_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "vlx2-devops_vpc_igw"
  }
}


# resource "aws_eip" "ip" {
# }

# resource "aws_nat_gateway" "devopsnat" {
#   allocation_id = aws_eip.ip.id
#   subnet_id     = aws_subnet.pub_subnet_1.id

# }