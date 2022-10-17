resource "aws_eks_cluster" "eks-demo-cluster" {
  name     = "demo-cluster"
  role_arn = aws_iam_role.cluster-role.arn
  version = "1.23"

  vpc_config {
    subnet_ids = "${module.eks-vpc.public_subnets}"
    endpoint_private_access = "${var.endpoint_private_access}"
    endpoint_public_access = "${var.endpoint_public_access}"
    public_access_cidrs ="${var.cluster_public_access_cidrs}"
  }

  kubernetes_network_config {
    service_ipv4_cidr = "${var.cluster_service_ipv4_cidr}"
  }
       #eks-cluster-plane-logging

    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]


  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-iam-role-attach,
    aws_iam_role_policy_attachment.eksvpcresourcecontroller,
  ]
}

