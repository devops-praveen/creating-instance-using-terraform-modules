provider "aws" { 
}
data "aws_eks_cluster" "eks" {
  name = "${ data.terraform_remote_state.eks-cluster.outputs.cluster_id}"
}
data "aws_eks_cluster_auth" "cluster_auth" {
  name = "${ data.terraform_remote_state.eks-cluster.outputs.cluster_id}"
}

provider "kubernetes" {
  host                   = "${ data.terraform_remote_state.eks-cluster.outputs.cluster_endpoint}"
  cluster_ca_certificate = base64decode("${ data.terraform_remote_state.eks-cluster.outputs.cluster_certificate_authority_data}")
  token                  = "${ data.aws_eks_cluster_auth.cluster_auth.token}"
}

