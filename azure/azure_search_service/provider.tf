terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  
}

provider "azurerm" {
  alias = "vhub"
  features {}
  
}