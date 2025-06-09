resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnet_1" {
  cidr_block = var.pub-1-cidr-block
  vpc_id = aws_vpc.main.id
  availability_zone = var.pub-1-az
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block = var.pub-2-cidr-block
  vpc_id = aws_vpc.main.id
  availability_zone = var.pub-2-az
  map_public_ip_on_launch = true
}

