data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_availability_zones" "available" {
}


##The intention is to take list of nodegroups and convert into the format node_groups expects i.e map()
##However, for_each loop only works inside a resource block and cannot do any operation inside node_groups variable
##Hence, creating a null resource and convert the variable from list to map and reference in node_groups variable

locals {
  #it should be {node_groups = {ng1 = {} ng2 = {}}
  #ref: https://stackoverflow.com/questions/62679195/terraform-looping-in-list-of-map How this local works
  ##either name or nameprefix 
  ng_list = { for ng in var.node_groups : ng.ng_name => ng }
  ng_list_replacements = { for k, v in local.ng_list : k => merge({
    capacity_type = v.spot ? "SPOT" : "ON_DEMAND"
    instance_types = [v.instance_type]
    name_prefix   = "${v.ng_name}-"
    version = var.cluster.version
    k8s_labels = merge(v.k8s_labels, { Environment = var.env })
  }, v)}
}

module "eks" {
  source                   = "terraform-aws-modules/eks/aws"
  version                  = "v17.4.0"
  cluster_name             = var.cluster.name
  cluster_version          = var.cluster.version
  wait_for_cluster_timeout = 900
  subnets                  = var.vpc.subnets

  vpc_id = var.vpc.id

  node_groups = local.ng_list_replacements

  enable_irsa = true
  
  map_roles = var.map_roles
  map_users    = var.map_users
  map_accounts = var.map_accounts
}