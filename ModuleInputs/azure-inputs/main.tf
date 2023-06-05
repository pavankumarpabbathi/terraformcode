module "resourcegroup" {
  source = "../../azure_modules/resourcegroup"
  location = var.location
  tags = var.tags
  resource_group_name = var.resource_group_name
}

module "vnet" {
  depends_on = [module.resourcegroup]
  source = "github.com/Azure/terraform-azurerm-vnet?ref=2.6.0"
  resource_group_name = var.resource_group_name
  vnet_location       = var.location
  vnet_name           = var.network_name
  address_space       = var.network_address_space
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  tags = var.tags
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

module "web" {
  source = "../../azure_modules/azure_vm"
  location = var.location
  tags = var.web_vm_tags
  resource_group_name = var.resource_group_name
  publicip_address_enabled = var.web_publicip_address_enabled
  vm_name = var.web_vm_name
  vm_subnet_name = module.vnet.vnet_subnets[0]
  node_size = var.vm_node_size
  admin_username = var.admin_username
  admin_password = var.admin_password
}