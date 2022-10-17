resource "aws_iam_policy" "ebs-csi-policy" {
  name        = "ebs-csi-policy"
  path        = "/"
  description = "my-ebs-driver"
  policy = "${data.http.ebs-iam-policy.body}"
}

resource "aws_iam_role" "ebs-role" {
  name = "ebs-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
    Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "${data.terraform_remote_state.eks-cluster.outputs.aws_iam_openid_connect_provider_arn}"
        }
        Condition = {
          StringEquals = {            
            "${data.terraform_remote_state.eks-cluster.outputs.aws_iam_openid_connect_provider_extract_from_arn}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
          }
        }        

      },
    ]
  })
  tags = {
    tag-key = "ebs-csi"
  }
}
resource "aws_iam_role_policy_attachment" "ebs-csi-attach" {
  role       = "${aws_iam_role.ebs-role.name}"
  policy_arn = "${aws_iam_policy.ebs-csi-policy.arn}"
}  



