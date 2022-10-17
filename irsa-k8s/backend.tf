terraform {
  backend "s3" {
    bucket = "terraformtestdev"
    key    = "irsa-k8s.tfstate"
    region = "us-east-1"
  }

}