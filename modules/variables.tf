variable "vpc_cidr" {
    description = "Value of the VPC CIDR block"
    type        = string
    default     = "10.0.0.0/16"
}

variable "environment" {
    description = "Environment for the VPC (e.g., dev, staging, prod)"
    type        = string
    default     = "dev"
}

variable "pub-1-cidr-block" {
    description = "CIDR block for the first public subnet"
    type        = string
    default     = "10.0.1.0/24"
  
}

variable "pub-1-az" {
    description = "Availability Zone for the first public subnet"
    type        = string
    default     = "us-east-1a"
}
variable "pub-2-cidr-block" {
    description = "CIDR block for the second public subnet"
    type        = string
    default     = "10.0.2.0/24"
}

variable "pub-2-az" {
    description = "Availability Zone for the second public subnet"
    type        = string
    default     = "us-east-1b"
}