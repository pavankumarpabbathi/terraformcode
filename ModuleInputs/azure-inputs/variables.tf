##############################
# Common Parameters        ###
##############################
variable "location" {
  type  = string
  description = "The Azure Region where the Resource Group should exist."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}


#################################
# Resourcegroup Parameters    ### 
#################################
variable "resource_group_name" {
  type  = string
  description = "Name of the resource group."
}

#################################
#. Network Input Parameters.  ###
#################################
variable "network_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "network_address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}


variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["web", "app", "report"]
}

######## Azure VM Common Details #####

variable "node_size" {
  type        = string
  description = "The default virtual machine size for the Nodes"
  default     = "Standard_DS4_v2"
}

variable "admin_username" {
  type        = string
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "adminuser"
}

variable "admin_password" {
  type        = string
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
  default     = "admin123#"
} 

variable "vm_node_size" {
  type        = string
  description = "The default virtual machine size for the Nodes"
  default     = "Standard_DS4_v2"
}

###### Azure Web VM Details ####
variable "web_vm_name" {
    type = string
    description = "The name of the Linux Virtual Machine."
}

variable "web_publicip_address_enabled" {
    type = bool
    description = "Public IP should be enabled or not"
}

variable "web_vm_subnet_name" {
  type        = string
  description = "Name of the vm subnet"
  default     = null
}

variable "web_vm_tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}