variable "vpc_cidr" {
    description = "vpc cidr"
    type = string
  
}

variable "vpc_name" {
    description = "vpc name"
    type = string
  
}

variable "az1" {
    description = "availability zone"
    type = string
  
}

variable "az2" {
    description = "availability zone"
    type = string
  
}

variable "pub_subnet_1_cidr" {
    description = "vpc public subnet cidr"
    type = string
  
}

variable "pub_subnet_2_cidr" {
    description = "vpc public subnet cidr"
    type = string
  
}

variable "pub_subnet_1_name" {
    description = "name of the vpc subnet"
    type = string
  
}


variable "pub_subnet_2_name" {
    description = "name of the vpc subnet"
    type = string
  
}

variable "pub_rt_name" {
    description = "name of the public route-table"
    type = string
  
}

variable "def_routes" {
    description = "default routes"
    type = string
    default = "0.0.0.0/0"
  
}