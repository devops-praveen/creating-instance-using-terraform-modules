resource "aws_eip" "ec2-eip" {
    depends_on = [module.ec2-bastion,module.eks-vpc]
  instance = "${module.ec2-bastion.id}"
  vpc      = true
}