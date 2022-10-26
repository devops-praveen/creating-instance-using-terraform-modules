terraform {
  backend "s3" {
    bucket = "terraformtestdev"
    key    = "eks-addon"
    region = "us-east-1"
  }

}