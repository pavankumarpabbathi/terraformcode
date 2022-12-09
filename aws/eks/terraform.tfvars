aws_region = "ap-south-1"
default_tags = {
    "name"        = "eks-test"
    "type"        = "eks"
    "eks-engine"  = "ap-south-1"
    "dev" = "true"
}
map_roles = []
map_users = []
map_accounts = []
env = "dev"
vpc = {
  id      = "vpc-00c713f71f789b623"
  subnets = ["subnet-0389f619895dea24b", "subnet-05784248f16a43120", "subnet-0d00d9b4e12b86a69"]
}

cluster = {
  name = "cluster-nodegroup-testing"
  version = "1.24"
}

node_groups = [
    {
      ng_name = "firstng"
      ami_type = "AL2_x86_64"
      desired_capacity = 2
      max_capacity = 2
      min_capacity = 1
      disk_size = 50
      instance_type = "t3.small"
      spot = false
      k8s_labels = {}
      taints = []
    },
    {
      ng_name = "secondng"
      desired_capacity = 2
      ami_type = "AL2_x86_64"
      max_capacity = 2
      min_capacity = 1
      disk_size = 50
      instance_type = "t3.medium"
      spot = true
      k8_labels = {
        "type": "observability"
      }
      taints = []
    }
]