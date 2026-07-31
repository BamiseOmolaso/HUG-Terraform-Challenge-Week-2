# Root module: wire reusable modules together (same outcome as Week One).

module "vpc" {
  source = "./modules/vpc"

  cidr_block   = var.vpc_cidr
  project_name = var.project_name
}

module "networking" {
  source = "./modules/networking"

  vpc_id       = module.vpc.vpc_id
  subnet_cidr  = var.subnet_cidr
  project_name = var.project_name
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "compute" {
  source = "./modules/compute"

  subnet_id         = module.networking.subnet_id
  security_group_id = module.security_groups.security_group_id
  project_name      = var.project_name
  full_name         = var.full_name
  instance_type     = var.instance_type
  key_name          = var.key_name
}
