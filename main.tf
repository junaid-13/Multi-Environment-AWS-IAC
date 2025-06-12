module "vpc_dev" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/SG's"
  dev_vpc_id   = module.vpc.dev_vpc_id
  qa_vpc_id    = module.vpc.qa_vpc_id
  prod_vpc_id  = module.vpc.prod_vpc_id
}