module "ec2-bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion-instance"

  ami                    = "${data.aws_ami.linux.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_Name}"
  vpc_security_group_ids = ["${module.eks-vpc-sg.security_group_id}"]
  subnet_id              = "${module.eks-vpc.public_subnets[0]}"
  tags = {
    owner = "praveen"
    Environment = "dev"
  }
}