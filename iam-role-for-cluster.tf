resource "aws_iam_role" "cluster-role" {
  name = "eks-cluster-role"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks-cluster-role"
  }
}
resource "aws_iam_role_policy_attachment" "cluster-iam-role-attach" {
  role       = "${aws_iam_role.cluster-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eksvpcresourcecontroller" {
  role       = "${aws_iam_role.cluster-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}