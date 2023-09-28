output "vpc_id" {
    value = aws_vpc.devops_vpc.id
  
}

output "vpc_subnet_cidr" {
    value = aws_vpc.devops_vpc.cidr_block
  
}

output "pub_subnet_1_id" {
    value = aws_subnet.pub_subnet_1.id

}

output "pub_subnet_2_id" {
    value = aws_subnet.pub_subnet_2.id
  
}