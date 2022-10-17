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

output "cluster_id" {
    value = "${aws_eks_cluster.eks-demo-cluster.id}" 
}
output "cluster_arn" {
    value = "${aws_eks_cluster.eks-demo-cluster.arn}" 
}

output "cluster_certificate_authority_data" {
    value = "${aws_eks_cluster.eks-demo-cluster.certificate_authority[0].data}"
}

output "cluster_endpoint" {
    value = "${aws_eks_cluster.eks-demo-cluster.endpoint}"
}
output "cluster_version" {
    value = "${aws_eks_cluster.eks-demo-cluster.version}"
}
output "cluster_security_group_id" {
    value = ["${aws_eks_cluster.eks-demo-cluster.vpc_config[0].security_group_ids}"]
}
output "cluster_iam_role_name" {
    value = "${aws_iam_role.cluster-role.name}"
}
output "cluster_iam_role_arn" {
    value = "${aws_iam_role.cluster-role.arn}"
}
output "cluster_primary_security_group_id" {
    value ="${aws_eks_cluster.eks-demo-cluster.vpc_config[0].cluster_security_group_id}"
}

output "node_group_public_id" {
    value = "${aws_eks_node_group.eks-nodegroup.id}"
}

output "node_group_public_arn" {
    value = "${aws_eks_node_group.eks-nodegroup.arn}"
}

output "node_group_public_status" {
  value = "${aws_eks_node_group.eks-nodegroup.status}"   
}
/*
output "node_group_private_id" {
    value = "${aws_eks_node_group.worker-private.id}"
}

output "node_group_public_arn" {
    value = "${aws_eks_node_group.worker-private.arn}"
}

output "node_group_public_status" {
  value = "${aws_eks_node_group.worker-private.status}"   
}
*/