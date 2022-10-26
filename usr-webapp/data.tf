data "terraform_remote_state" "eks-cluster" {
  backend = "s3"

  config = {
    bucket = "terraformtestdev"
    key    = "eks-module.tfstate"
    region = "us-east-1"
  }
}