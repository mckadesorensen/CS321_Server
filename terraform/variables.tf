variable "DEPLOY_NAME" {
  type = string
}

variable "instance_type" {
  default = "t2.nano"
}

variable "vpc_cidr" {
    description = "CIDR for the entire VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr_one" {
    description = "CIDR: Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr_one" {
    description = "CIDR: Private Subnet"
    default = "10.0.1.0/24"
}

variable "public_subnet_cidr_two" {
    description = "CIDR: Public Subnet"
    default = "10.0.0.0/25"
}

variable "private_subnet_cidr_two" {
    description = "CIDR: Private Subnet"
    default = "10.0.1.0/25"
}



