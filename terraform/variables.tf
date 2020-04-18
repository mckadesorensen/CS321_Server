variable "DEPLOY_NAME" {
  type = string
}

variable "ami" {
  description = "AMI for EC2"
  default = {
    ami = "ami-0323c3dd2da7fb37d" // Amazon Linux 2
  }
}

variable "vpc_cidr" {
    description = "CIDR for the entire VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR: Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR: Private Subnet"
    default = "10.0.1.0/24"
}