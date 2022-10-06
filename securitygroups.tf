module "eks-vpc-sg" {  
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"
  name        = "my-sg"
  vpc_id      = "${module.eks-vpc.vpc_id}"

  ingress_rules            = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  tags = {
    Name = "eks-sg"
  }
}