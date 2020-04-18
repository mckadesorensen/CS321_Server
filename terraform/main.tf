terraform {
  required_providers {
    aws  = "~> 2.46.0"
    null = "~> 2.1.0"
  }
}

provider "aws" {

}

resource "aws_vpc" "cs321-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${local.prefix}-vpc"
  }
}


resource "aws_security_group" "cs371-security-group" {
  name = "${local.prefix}-security-group"
  vpc_id = aws_vpc.cs321-vpc.id

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]  // TODO: Update
  }
}
