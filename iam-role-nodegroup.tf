resource "aws_iam_role" "nodegroup-role" {
  name = "eks-Nodegroup"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks-nodegroup"
  }
}

resource "aws_iam_role_policy_attachment" "WorkerNodegroup-iam-role-attach" {
  role       = "${aws_iam_role.nodegroup-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "CNI-iam-role-attach" {
  role       = "${aws_iam_role.nodegroup-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ECR-iam-role-attach" {
  role       = "${aws_iam_role.nodegroup-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}