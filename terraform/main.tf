provider "kubernetes" {
  config_path = "./outputs/kubeconfig"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.26"
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
    }
  }
}

resource "kubernetes_manifest" "sealed_secrets_controller" {
  manifest = yamldecode(file("${path.module}/sealed-secrets-controller.yaml"))
}
