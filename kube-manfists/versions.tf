terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
/*
    provider "kubernetes" {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
}
*/
}
}