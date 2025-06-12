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

  tags = {
    Name = "Dev Public Subnet 1"
    Environment = var.environment
  }
}


resource "aws_subnet" "dev_private_subnet" {
  cidr_block = var.dev-pri-1-cidr-block
  vpc_id = aws_vpc.Dev_vpc.id
  availability_zone = var.dev-pri-1-az
  map_public_ip_on_launch = false
  tags = {
    Name = "Dev Private Subnet"
    Environment = var.environment
  }
  
}

resource "aws_subnet" "qa-public_subnet_1" {
  cidr_block = var.qa-pub-1-cidr-block
  vpc_id = aws_vpc.QA_vpc.id
  availability_zone = var.qa-pub-1-az
  map_public_ip_on_launch = true
  tags = {
    Name = "QA Public Subnet 1"
    Environment = var.qa_environment
  }
}

resource "aws_subnet" "qa_private_subnet" {
  cidr_block = var.qa-pri-1-cidr-block
  vpc_id = aws_vpc.QA_vpc.id
  availability_zone = var.qa-pri-1-az
  map_public_ip_on_launch = false
  tags = {
    Name = "QA Private Subnet"
    Environment = var.qa_environment
  }
  
}

resource "aws_subnet" "prod_public_subnet_1" {
  cidr_block = var.prod-pub-1-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pub-1-az
  map_public_ip_on_launch = true
  tags = {
    Name = "Prod Public Subnet 1"
    Environment = var.prod_environment
  }
}

resource "aws_subnet" "prod_public_subnet_2" {
  cidr_block = var.prod-pub-2-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pub-2-az
  map_public_ip_on_launch = true
  tags = {
    Name = "Prod Public Subnet 2"
    Environment = var.prod_environment
  }
}

resource "aws_subnet" "prod_private_subnet_1" {
  cidr_block = var.prod-pri-1-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pri-1-az
  map_public_ip_on_launch = false
  tags = {
    Name = "Prod Private Subnet 1"
    Environment = var.prod_environment
  }
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block = var.prod-pri-2-cidr-block
  vpc_id = aws_vpc.prod_vpc.id
  availability_zone = var.prod-pri-2-az
  map_public_ip_on_launch = false
  tags = {
    Name = "Prod Private Subnet 2"
    Environment = var.prod_environment
  }
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.Dev_vpc.id

  tags = {
    Name = "Dev Internet Gateway"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "qa_igw" {
  vpc_id = aws_vpc.QA_vpc.id

  tags = {
    Name = "QA Internet Gateway"
    Environment = var.qa_environment
  }
}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "Prod Internet Gateway"
    Environment = var.prod_environment
  }
}

resource "aws_eip" "dev_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "Dev NAT EIP"
    Environment = var.environment
  }
}

resource "aws_eip" "qa_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "QA NAT EIP"
    Environment = var.qa_environment
  }
}

resource "aws_eip" "prod_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "Prod NAT EIP"
    Environment = var.prod_environment
  }
}

resource "aws_nat_gateway" "dev_nat" {
  allocation_id = aws_eip.dev_nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Dev NAT Gateway"
    Environment = var.environment
  }
  
}

resource "aws_nat_gateway" "qa_nat" {
  allocation_id = aws_eip.qa_nat_eip.id
  subnet_id     = aws_subnet.qa-public_subnet_1.id

  tags = {
    Name = "QA NAT Gateway"
    Environment = var.qa_environment
  }
}

resource "aws_nat_gateway" "prod_nat" {
  allocation_id = aws_eip.prod_nat_eip.id
  subnet_id     = aws_subnet.prod_public_subnet_1.id

  tags = {
    Name = "Prod NAT Gateway"
    Environment = var.prod_environment
  }
}

resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.Dev_vpc.id

  tags = {
    Name = "Dev Public Route Table"
    Environment = var.environment
  }
}

resource "aws_route_table" "qa_public_rt" {
  vpc_id = aws_vpc.QA_vpc.id

  tags = {
    Name = "QA Public Route Table"
    Environment = var.qa_environment
  }
}

resource "aws_route_table" "prod_public_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "Prod Public Route Table"
    Environment = var.prod_environment
  }
}

resource "aws_route" "dev-route-1-from-igw-to-public-subnet" {
  route_table_id         = aws_route_table.dev_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_igw.id
}

resource "aws_route" "qa-route-1-from-igw-to-public-subnet" {
  route_table_id         = aws_route_table.qa_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.qa_igw.id 
}

resource "aws_route" "prod-route-1-from-igw-to-public-subnet" {
  route_table_id         = aws_route_table.prod_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.prod_igw.id
}

resource "aws_route_table_association" "dev_public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.dev_public_rt.id
}

resource "aws_route_table_association" "qa_public_subnet_1_association" {
  subnet_id      = aws_subnet.qa-public_subnet_1.id
  route_table_id = aws_route_table.qa_public_rt.id
}

resource "aws_route_table_association" "prod_public_subnet_1_association" {
  subnet_id      = aws_subnet.prod_public_subnet_1.id
  route_table_id = aws_route_table.prod_public_rt.id
}

resource "aws_route_table" "dev_private_rt" {
  vpc_id = aws_vpc.Dev_vpc.id

  tags = {
    Name = "Dev Private Route Table"
    Environment = var.environment
  }
}

resource "aws_route_table" "qa_private_rt" {
  vpc_id = aws_vpc.QA_vpc.id

  tags = {
    Name = "QA Private Route Table"
    Environment = var.qa_environment
  }
}

resource "aws_route_table" "prod_private_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "Prod Private Route Table"
    Environment = var.prod_environment
  }
}

resource "aws_route_table_association" "dev_private_subnet_association" {
  subnet_id      = aws_subnet.dev_private_subnet.id
  route_table_id = aws_route_table.dev_private_rt.id
}

resource "aws_route_table_association" "qa_private_subnet_association" {
  subnet_id      = aws_subnet.qa_private_subnet.id
  route_table_id = aws_route_table.qa_private_rt.id
}

resource "aws_route_table_association" "prod_private_subnet_association" {
  subnet_id      = aws_subnet.prod_private_subne_1.id
  route_table_id = aws_route_table.prod_private_rt.id
}