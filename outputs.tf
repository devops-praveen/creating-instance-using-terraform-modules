output "vpc_id" {
    value = "${module.eks-vpc.vpc_id}" 
}
output "vpc_cidr" {
    value = "${module.eks-vpc.vpc_cidr_block}" 
}
output "public_subnets" {
    value = "${module.eks-vpc.public_subnets}" 
}

output "private_subnets" {
    value = "${module.eks-vpc.private_subnets}" 
}

output "database_subnets" {
    value = "${module.eks-vpc.database_subnets}" 
}
output "public_igw" {
    value = "${module.eks-vpc.igw_id}" 
}


output "public_natgateway_eip" {
    value = "${module.eks-vpc.nat_public_ips}"  
}

output "ec2_bastion" {
     value = "${module.ec2-bastion.id}"  
}
output "ec2_bastion_public_ip" {
     value = "${aws_eip.ec2-eip.public_ip}"  
}

