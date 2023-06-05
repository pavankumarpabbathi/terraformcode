location = "eastus" 
tags = {
   env = "test"
}
resource_group_name = "testenvironment-rg"

####Netowkr Inputs
network_name = "testenvironemnt-vnet"
network_address_space = ["10.0.0.0/16"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_names = ["web", "app", "report"]

######### VM Details
vm_node_size = "Standard_D4s_v3"
admin_username = "admin123"
admin_password = "admin@1031111"

####Web vm details
web_publicip_address_enabled = true
web_vm_name = "web"
web_vm_subnet_name = "web"
web_vm_tags = {
   env = "web"
}