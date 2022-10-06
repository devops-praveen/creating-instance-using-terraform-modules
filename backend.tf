terraform {
  backend "s3" {
    bucket = "terraformtestdev"
    key    = "eks-module.tfstate"
    region = "us-east-1"
  }

}
