terraform {
  backend "s3" {
    bucket = "terraformtestdev"
    key    = "k8s.tfstate"
    region = "us-east-1"
  }

}



