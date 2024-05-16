region               = "us-west-2"
vpc_name             = "my-vpc"
vpc_cidr_block       = "10.0.0.0/16"
availability_zones   = ["us-west-2a", "us-west-2b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = true
tags = {
  Environment = "dev"
  Project     = "vpc"
}
