resource "aws_vpc" "Dev_vpc" {
  cidr_block = var.dev_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Dev VPC"
    Environment = var.environment
  }
}

resource "aws_vpc" "QA_vpc" {
  cidr_block = var.qa_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "QA VPC"
    Environment = var.qa_environment
  }
  
}

resource "aws_vpc" "prod_vpc" {
  cidr_block = var.prod_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Prod VPC"
    Environment = var.prod_environment
  }
  
}

resource "aws_subnet" "public_subnet_1" {
  cidr_block = var.dev-pub-1-cidr-block
  vpc_id = aws_vpc.Dev_vpc.id
  availability_zone = var.dev-pub-1-az
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block = var.dev-pub-2-cidr-block
  vpc_id = aws_vpc.Dev_vpc.id
  availability_zone = var.dev-pub-2-az
  map_public_ip_on_launch = true
}

resource "aws_subnet" "qa-public_subnet_1" {
  cidr_block = var.qa-pub-1-cidr-block
  vpc_id = aws_vpc.QA_vpc.id
  availability_zone = var.qa-pub-1-az
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "prod_public_subnet_1" {
  cidr_block = var.prod-pub-1-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pub-1-az
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "prod_public_subnet_2" {
  cidr_block = var.prod-pub-2-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pub-2-az
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "private_subnet_1" {
  cidr_block = var.prod-pri-1-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pri-1-az
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block = var.prod-pri-2-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pri-2-az
}