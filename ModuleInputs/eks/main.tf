locals {
  # Automatically load environment-level variables
  env    = "testing"
  region = "ap-south-1"
}

module "eks" {
  source       = "../../aws/eks"
  default_tags = {}
  spot_tags = {
    "k8s.io/cluster-autoscaler/node-template/label/lifecycle" : "Ec2Spot"
    "k8s.io/cluster-autoscaler/node-template/label/aws.amazon.com/spot" : "true"
    "k8s.io/cluster-autoscaler/node-template/label/gpu-count" : "0"
    "k8s.io/cluster-autoscaler/node-template/taint/spotInstance" : "true:PreferNoSchedule"
    "k8s.io/cluster-autoscaler/enabled" : "true"
  }
  on_demand_tags = {
    # EC2 tags required for cluster-autoscaler auto-discovery
    "k8s.io/cluster-autoscaler/node-template/label/lifecycle" : "OnDemand"
    "k8s.io/cluster-autoscaler/node-template/label/aws.amazon.com/spot" : "false"
    "k8s.io/cluster-autoscaler/node-template/label/gpu-count" : "0"
    "k8s.io/cluster-autoscaler/enabled" : "true"
  }
  env = local.env
  vpc = {
    name    = "${local.env}"
    id      = "vpc-xxxxxxxxx"
    subnets = []
  }
  cluster = {
    name    = "multi-nodegroup-testing"
    version = "1.21" # "{ {.Spec.PlatformVersion} }" TODO: add platform version
  }
  node_groups = [
    {
      ng_name          = "first-ng"
      ami_type         = "AL2_x86_64"
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1
      disk_size        = 50
      instance_type    = "t3.small"
      #capacity_type = "SPOT"
      spot   = false
      labels = {}
      taints = []
    },
    {
      ng_name          = "second-ng"
      desired_capacity = 2
      ami_type         = "AL2_x86_64"
      max_capacity     = 2
      min_capacity     = 1
      disk_size        = 50
      instance_type    = "t3.medium"
      spot             = true
      k8_labels = {
        "type" : "observability"
      }
      taints = []
    }
  ]
  aws_region = local.region
}