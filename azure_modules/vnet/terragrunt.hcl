include "root" {
  path = find_in_parent_folders("backend-generator.hcl")
}

terraform {
  source = "github.com/Azure/terraform-azurerm-vnet?ref=2.6.0"
}

locals {
  all_vars = jsondecode(file("../humalect_vars.tfvars.json"))
}


generate "output" {
  path      = "subnetoutputs.tf"
  if_exists = "overwrite"
  contents = <<EOF
output "pod_subnet" {
  description = "The ids of subnets created inside the newl vNet"
  value       = azurerm_subnet.subnet[1].id
}
output "node_subnet" {
  description = "The ids of subnets created inside the newl vNet"
  value       = azurerm_subnet.subnet[0].id
}
EOF
}

inputs = {
  resource_group_name = get_env("resource_group_name")
  vnet_location       = get_env("region")
  vnet_name           = get_env("network_name")
  address_space       = lookup(local.all_vars, "address_space", "10.0.0.0/8") 
  subnet_prefixes     = values(lookup(local.all_vars, "subnets"))
  subnet_names        = keys(lookup(local.all_vars, "subnets"))
  tags = lookup(local.all_vars, "tags")
  subnet_delegation = {
    podsubnet = {
      "aks-delegation" = {
        service_name = "Microsoft.ContainerService/managedClusters"
        service_actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
        ]
      }
    }
  }
}