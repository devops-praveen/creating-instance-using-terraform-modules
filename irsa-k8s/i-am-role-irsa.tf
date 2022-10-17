resource "aws_iam_role" "irsa-role" {
  name = "sa-role-s3"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            #Effect = "Allow"
            Action = "sts:AssumeRoleWithWebIdentity"
            Effect = "Allow"
            Sid = ""
            Principal = {
              Federated = "${data.terraform_remote_state.eks-cluster.outputs.aws_iam_openid_connect_provider_arn}"
            }
            Condition = {
              StringEquals = {            
                 "${data.terraform_remote_state.eks-cluster.outputs.aws_iam_openid_connect_provider_extract_from_arn}:sub": "system:serviceaccount:default:sa-job"
          },
             }
        }
               
            ]
        })
 tags = {
    tag-key = "SAROLE-S3"
  }

}

resource "aws_iam_policy_attachment" "role-attach" {
  name       = "sa-attach"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  roles = ["${aws_iam_role.irsa-role.name}"] 
}

output "irsa_iam_role_arn" {
    value ="${aws_iam_role.irsa-role.arn}"
}



  

 
