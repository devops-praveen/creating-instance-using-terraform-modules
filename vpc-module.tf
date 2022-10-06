data "aws_availability_zones" "my-az" {
#  state = "available"
}

module "eks-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${var.vpc_Name}"
  cidr = "${var.vpc_cidr}"

  azs             = "${data.aws_availability_zones.my-az.names}"
  private_subnets = "${var.private_subnets_cidr}"
  public_subnets  = "${var.public_subnets_cidr}"
  
  create_database_subnet_group = true
  create_database_subnet_route_table= true
 
  database_subnets = "${var.database_subnets_cidr}"

  enable_nat_gateway = true
  single_nat_gateway = true
  #enablae_route_gateway = true

  enable_dns_hostnames = true
  enable_dns_support = true
  
  public_subnet_tags = {
    "Name" = "${var.public_subnet_tags}"
  }

   private_subnet_tags = {
    "Name" = "${var.private_subnet_tags}"
  }

  database_subnet_tags = {
    "Name" = "${var.database_subnet_tags}"
  }


  tags = {
    owner = "praveen"
    Environment = "dev"
  }

  vpc_tags = {
    "Name" = "eks-vpc"
  }
}