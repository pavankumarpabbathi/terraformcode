variable "resource_group_name" {
  type  = string
  description = "Name of the resource group."
}

variable "location" {
  type  = string
  description = "The Azure Region where the Resource Group should exist."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}

