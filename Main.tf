provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"  # Specify the version of the module

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr_block
  azs                  = var.availability_zones
  private_subnets      = var.private_subnet_cidrs
  public_subnets       = var.public_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  public_subnet_tags   = { "Name" = "Public Subnet" }
  private_subnet_tags  = { "Name" = "Private Subnet" }
  tags                 = var.tags

  # Additional optional settings
  enable_dns_support         = true
  enable_dns_hostnames       = true
  enable_classiclink         = false
  enable_classiclink_dns_support = false
  enable_ipv6                = false
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "nat_gateway_ids" {
  value = module.vpc.nat_gateway_ids
}
