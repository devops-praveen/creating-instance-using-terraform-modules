
data "aws_partition" "current" {
  
}


resource "aws_iam_openid_connect_provider" "oidc-provider" {
  url = "${aws_eks_cluster.eks-demo-cluster.identity[0].oidc[0].issuer}"

  client_id_list = [
    "sts.${data.aws_partition.current.dns_suffix}"]

  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]
}
/*
tags = {
    Name = "demo-cluster-eks-irsa"
}
*/

output "aws_iam_openid_connect_provider_arn" {
    value = "${aws_iam_openid_connect_provider.oidc-provider.arn}"
}

# Extract OIDC Provider from OIDC Provider ARN
locals {
    aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc-provider.arn}"), 1)
}
# Output: AWS IAM Open ID Connect Provider
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
   value = local.aws_iam_oidc_connect_provider_extract_from_arn
}
