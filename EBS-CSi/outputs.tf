output "ebs-csi" {
  value = "${data.http.ebs-iam-policy.body}"
}

output "ebs-hlem-metadata" {
    value = "${helm_release.ebs-csi-driver-helm.metadata}"  
}

output "ebs-csi-policy-arn" {
  value = "${aws_iam_policy.ebs-csi-policy.arn}"
}

output "ebs-role-arn" {
    value = "${aws_iam_role.ebs-role.arn}"
  
}