terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.59.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id = "<SUBSCRIPTION_ID>" ##Subscription id is mandatory when connecting with client_secret
  # client_id       = "<CLIENT_ID>"
  # client_secret   = "<CLIENT_SECRET>"
  # tenant_id       = "<TENANT_ID>"
}