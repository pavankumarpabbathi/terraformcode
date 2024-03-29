####Common Variables#####
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = null
}

variable "location" {
  type        = string
  description = "The Azure location where the Linux Virtual Machine should exist."
  default     = null
}

variable "vm_name" {
    type = string
    description = "The name of the Linux Virtual Machine."
    default = null
}

variable "publicip_address_enabled" {
    type = bool
    description = "Public IP should be enabled or not"
    default = null
}

variable "vm_subnet_name" {
  type        = string
  description = "Name of the vm subnet"
  default     = null
}

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

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}