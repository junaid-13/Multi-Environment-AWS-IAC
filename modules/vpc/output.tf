output "dev_vpc_id" {
  value = aws_vpc.Dev_vpc.id
}

output "qa_vpc_id" {
  value = aws_vpc.QA_vpc.id
}

output "prod_vpc_id" {
  value = aws_vpc.Prod_vpc.id
}

output "dev_igw_id" {
  value = aws_internet_gateway.dev_igw.id
}

output "qa_igw_id" {
  value = aws_internet_gateway.qa_igw.id
}

output "prod_igw_id" {
  value = aws_internet_gateway.prod_igw.id
}

output "dev_nat_eip_id" {
  value = aws_eip.dev_nat_eip.id
}

output "qa_nat_eip_id" {
  value = aws_eip.qa_nat_eip.id
}

output "prod_nat_eip_id" {
  value = aws_eip.prod_nat_eip.id
}

output "dev_nat_gateway_id" {
  value = aws_nat_gateway.dev_nat.id
}

output "qa_nat_gateway_id" {
  value = aws_nat_gateway.qa_nat.id
}

output "prod_nat_gateway_id" {
  value = aws_nat_gateway.prod_nat.id
}


