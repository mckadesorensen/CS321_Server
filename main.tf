terraform {
  required_providers {
    aws  = "~> 2.46.0"
    null = "~> 2.1.0"
  }
}

provider "aws" {
}

resource "aws_vpc" "cs321-vpc" {
  cidr_block = "10.0.0.0/16"
//  enable_classiclink = true

  tags = {
    Name = "cs321-vpc"
  }
}

resource "aws_subnet" "cs321-subnet" {
  vpc_id = aws_vpc.cs321-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "cs321-subnet"
  }
}

//data "aws_ami" "amazon-linux-2" {
//  most_recent = true
//
//  owners = ["amazon"]
//}
//
//resource "aws_instance" "cs321-ec2" {
//  ami = data.aws_ami.amazon-linux-2.id
//
//
//}
