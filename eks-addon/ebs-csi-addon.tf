resource "aws_eks_addon" "eks-ebs-addon" {
  depends_on               = [aws_iam_role_policy_attachment.ebs-csi-attach]
  cluster_name             = data.terraform_remote_state.eks-cluster.outputs.cluster_id
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = aws_iam_role.ebs-role.arn
}