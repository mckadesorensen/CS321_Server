terraform {
  required_providers {
    aws  = "~> 2.46.0"
    null = "~> 2.1.0"
  }
}

provider "aws" {

}

resource "aws_instance" "server" {
  ami = "ami-0915e09cc7ceee3ab"
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.project-security-group.id]

  tags = {
    Name = "${local.prefix}-server"
  }
}

resource "aws_vpc" "project-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true

  tags = {
    Name = "${local.prefix}-vpc"
  }
}

resource "aws_subnet" "project-public-subnet-one" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.public_subnet_cidr_one

  tags = {
    Name = "${local.prefix}-public-subnet-one"
  }
}

resource "aws_subnet" "project-private-subnet-one" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.private_subnet_cidr_one

  tags = {
    Name = "${local.prefix}-private-subnet-one"
  }
}

resource "aws_subnet" "project-public-subnet-two" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.public_subnet_cidr_two

  tags = {
    Name = "${local.prefix}-public-subnet-two"
  }
}

resource "aws_subnet" "project-private-subnet-two" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.private_subnet_cidr_two

  tags = {
    Name = "${local.prefix}-private-subnet-two"
  }
}


resource "aws_security_group" "project-security-group" {
  description = "Project Security Group"
  name = "${local.prefix}-project-security-group"
  vpc_id = aws_vpc.project-vpc.id

  ingress {
    from_port = 0
    protocol = "-1"  // TODO: Update.. probably
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]  // TODO: Update
  }
}

resource "aws_security_group" "project-db-security-group" {
  description = "Project DB Instance Security Group"
  name = "${local.prefix}-db-security-group"

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}

resource "aws_db_subnet_group" "project-db-subnet-group" {
  name = "${local.prefix}-db-subnet-group"
  subnet_ids = [
    aws_subnet.project-private-subnet-one.id,
    aws_subnet.project-public-subnet-one.id,
    aws_subnet.project-private-subnet-two.id,
    aws_subnet.project-private-subnet-two.id
  ]
}
