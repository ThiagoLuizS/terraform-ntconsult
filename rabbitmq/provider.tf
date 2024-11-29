data "aws_eks_cluster" "default" {
  name = var.cluster_name
  depends_on = [ module.eks.cluster_name ]
}

data "aws_eks_cluster_auth" "default" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--region", "us-east-2", "--cluster-name", data.aws_eks_cluster.default.name]
  }
}