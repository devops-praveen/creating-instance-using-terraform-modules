terraform {
  backend "s3" {
    bucket = "terraformtestdev"
    key    = "EBS-csi.tfstate"
    region = "us-east-1"
  }

}