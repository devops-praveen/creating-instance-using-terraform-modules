## worker node group for prviate
/*
resource "aws_eks_node_group" "worker-private" {
  cluster_name    = aws_eks_cluster. eks-demo-cluster.name
  node_group_name = "eks-ng-private"
  node_role_arn   = aws_iam_role.nodegroup-role.arn
  subnet_ids      = "${module.eks-vpc.private_subnets}"
  version = "1.23"
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = "10"
  instance_types = ["t3.medium"]


remote_access {
  ec2_ssh_key = "${var.key_Name}"
}

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
    #max_unavailable_percentage = 50
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.WorkerNodegroup-iam-role-attach,
    aws_iam_role_policy_attachment.CNI-iam-role-attach,
    aws_iam_role_policy_attachment.ECR-iam-role-attach,

  ]

  tags = {
    "Name" = "worker-prviate"
  }
}
*/