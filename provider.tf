terraform {
backend "s3" {
  bucket = "devopswale-tfstate"
  key = "/env/dev/terraform.tfstate"
  region = "us-east-1"
  encrypt = true
  dynamodb_table = "terraform-locks"
}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    required_version = ">= 1.0"
}
provider "aws" {
  region = "us-east-1"
  
}
provider "aws" {
  alias  = "us-east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west"
  region = "us-west-2"
}