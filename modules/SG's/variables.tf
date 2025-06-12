variable "dev_public_sg_name" {
  description = "Name of the public security group for the dev environment"
  type        = string
  default     = "dev-public-sg"
}

variable "dev_private_sg_name" {
  description = "Name of the private security group for the dev environment"
  type        = string
  default     = "dev-private-sg"
  
}

variable "qa_public_sg_name" {
  description = "Name of the public security group for the QA environment"
  type        = string
  default     = "qa-public-sg"
  
}

variable "qa_private_sg_name" {
  description = "Name of the private security group for the QA environment"
  type        = string
  default     = "qa-private-sg"

}

variable "prod_public_sg_name" {
  description = "Name of the public security group for the prod environment"
  type        = string
  default     = "prod-public-sg"

}

variable "prod_private_sg_name" {
  description = "Name of the private security group for the prod environment"
  type        = string
  default     = "prod-private-sg"

}

variable "qa-pub-1-cidr-block" {
  description = "CIDR block for the first public subnet in QA"
  type = string
  default = "125.0.1.0/24"
}

variable "qa-pri-1-cidr-block" {
  description = "CIDR block for the first private subnet in QA"
  type = string
  default = "125.0.2.0/24"

}

variable "prod-pub-1-cidr-block" {
  description = "CIDR block for the first public subnet in Production"
  type = string
  default = "198.0.1.0/24"

}

variable "prod-pub-2-cidr-block" {
  description = "CIDR block for the second public subnet in Production"
  type = string
  default = "198.0.3.0/24"
}

variable "prod-pri-1-cidr-block" {
  description = "CIDR block for the first private subnet in Production"
  type = string
  default = "198.0.2.0/24"

}

variable "prod-pri-2-cidr-block" {
  description = "CIDR block for the second private subnet in Production"
  type = string
  default = "198.0.4.0/24"
}

variable "dev_vpc_id" {
  type = string
}

variable "qa_vpc_id" {
  type = string
}

variable "prod_vpc_id" {
  type = string
}
