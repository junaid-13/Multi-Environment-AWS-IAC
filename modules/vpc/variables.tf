variable "environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"  
}

variable "qa_environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "qa"
}

variable "prod_environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "prod"
}

variable "qa_vpc_cidr" {
  description = "CIDR block for the QA VPC"
  type        = string
  default     = "125.0.0.0/16"
  
}

variable "dev_vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "prod_vpc_cidr" {
  description = "CIDR block for the Production VPC"
  type        = string
  default     = "198.0.0.0/16"
  
}
variable "dev-pub-1-cidr-block" {
  description = "CIDR block for the first public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "dev-pub-1-az" {
  description = "Availability Zone for the first public subnet"
  type = string
  default = "us-east-1a"
}

variable "dev-pub-2-cidr-block" {
  description = "CIDR block for the second public subnet"
  type = string
  default = "10.0.3.0/24" 
}
variable "dev-pub-2-az" {
  description = "Availability Zone for the second public subnet"
  type = string
  default = "us-east-1c"
}

variable "qa-pub-1-cidr-block" {
  description = "CIDR block for the first public subnet in QA"
  type = string
  default = "125.0.1.0/24"
}

variable "qa-pub-1-az" {
  description = "Availability Zone for the first public subnet in QA"
  type = string
  default = "us-east-1a"
}

variable "prod-pub-1-cidr-block" {
  description = "CIDR block for the first public subnet in Production"
  type = string
  default = "198.0.1.0/24"

}

variable "prod-pub-1-az" {
  description = "Availability Zone for the first public subnet in Production"
  type = string
  default = "us-east-1b"
}

variable "prod-pub-2-cidr-block" {
  description = "CIDR block for the second public subnet in Production"
  type = string
  default = "198.0.3.0/24"
}

variable "prod-pub-2-az" {
  description = "Availability Zone for the second public subnet in Production"
  type = string
  default = "us-east-1d"
}

variable "prod-pri-1-cidr-block" {
  description = "CIDR block for the first private subnet in Production"
  type = string
  default = "198.0.2.0/24"

}

variable "prod-pri-1-az" {
  description = "Availability Zone for the first private subnet in Production"
  type = string
  default = "us-east-1b"

}

variable "prod-pri-2-cidr-block" {
  description = "CIDR block for the second private subnet in Production"
  type = string
  default = "198.0.2.0/24"
}

variable "prod-pri-2-az" {
  description = "Availability Zone for the second private subnet in Production"
  type = string
  default = "us-east-1d"
}
