variable "vpc_cidr" {}
variable "vpc_Name" {}
#variable "region" {}
variable public_subnets_cidr {}
variable "private_subnets_cidr" {}
variable "database_subnets_cidr" {}
variable "private_subnet_tags" {}
variable "public_subnet_tags" {}
variable "database_subnet_tags" {}
variable "vpc_tags"{}
variable "instance_type" {}
variable "key_Name" {}
variable "endpoint_private_access" {}
variable "endpoint_public_access" {}
variable "cluster_public_access_cidrs" {}
variable "cluster_service_ipv4_cidr" {}
variable "eks_oidc_root_ca_thumbprint" {}