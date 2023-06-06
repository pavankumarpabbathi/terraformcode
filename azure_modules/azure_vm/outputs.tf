##############Azure Public IP#########
output "public_ip_address_id" {
  description = "The ID of this Public IP."
  value       = azurerm_public_ip.publicip[*].id
}

output "public_ip_address" {
  description = "The IP address value that was allocated."
  value       = azurerm_public_ip.publicip[*].ip_address
}

output "id" {
  description = "The ID of the Linux Virtual Machine."
  value       = azurerm_virtual_machine.vm.id
}

output "private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = data.azurerm_virtual_machine.vmdata.private_ip_address
}

