module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.31"
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    rabbitmq-nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      
      instance_types = ["t2.medium"]
    }
  }
}