######################
# ResourceGroup O/p###
######################
output "resource_group_id" {
    value = module.resourcegroup.resource_group_id
    description = "Resourcegroup unique id"
}

#########################
# Subnet details     ####
##########################
output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.vnet.vnet_name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.vnet.vnet_location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.vnet.vnet_address_space
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  value       = module.vnet.vnet_subnets
}


############### Azure VM O/p ####################
output "public_ip_id" {
  description = "The ID of this Public IP."
  value       = module.web.public_ip_address_id
}

output "public_ip_address" {
  description = "The IP address value that was allocated."
  value       = module.web.public_ip_address
}

output "id" {
  description = "The ID of the Linux Virtual Machine."
  value       = module.web.id
}

output "private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = module.web.private_ip_address
}

