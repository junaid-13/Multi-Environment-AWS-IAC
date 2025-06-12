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