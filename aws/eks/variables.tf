variable "aws_region" {
  description = "Aws region"
}

variable "default_tags" {
  description = "Default Tags for Auto Scaling Group"
  type        = map(string)
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
}

variable "cluster" {
  description = "All cluster info (singular)"
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "dev"
    version = "1.22"
  }
}

variable "vpc" {
  description = "All vpc info"
  type = object({
    id      = string
    subnets = list(string)
  })
}

variable "node_groups" {
  description = "list of nodegroups to create"
  type = list(object({
    ng_name = string
    desired_capacity = number
    max_capacity     = number
    min_capacity     = number
    disk_size        = number
    instance_type    = string
    spot             = bool
    k8s_labels       = optional(map(string))
    ami_type         = string
    taints           = optional(list(string))
  }))
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "env" {
  description = "environment name"
}