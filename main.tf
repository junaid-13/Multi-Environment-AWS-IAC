module "vpc_dev" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/SG's"
  dev_vpc_id   = module.vpc_dev.dev_vpc_id
  qa_vpc_id    = module.vpc_dev.qa_vpc_id
  prod_vpc_id  = module.vpc_dev.prod_vpc_id

}