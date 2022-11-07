terraform {
  required_version = ">= 0.15"

  required_providers {
    aws        = ">= 3.40.0"
    local      = ">= 1.4"
    kubernetes = ">= 1.21"
    random     = ">= 2.1"
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}