module "vpc_dev" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/SG's"
}