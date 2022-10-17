resource "kubernetes_service_account" "sa-s3" {
 depends_on = [ aws_iam_policy_attachment.role-attach ]
  metadata {
    name = "k8s-sa"
        annotations = {"eks.amazonaws.com/role-arn" = aws_iam_role.irsa-role.arn
      }
  }
}

