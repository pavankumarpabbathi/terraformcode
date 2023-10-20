terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "497a1ba8-8af7-4f4c-9bc7-e484d8b22d54"
  tenant_id       = "7aaf6f39-b967-4e4d-a180-8a7f346a77a4"
  client_id       = "c93c2aee-0e7b-48e8-8bf3-79eb18221b11"
  client_secret   = "6vd8Q~OGdL499LSVhPuZEWjvrRYwPqZrOB0Ajazm"
}

provider "azurerm" {
  alias = "vhub"
  features {}
  subscription_id = "497a1ba8-8af7-4f4c-9bc7-e484d8b22d54"
  tenant_id       = "7aaf6f39-b967-4e4d-a180-8a7f346a77a4"
  client_id       = "c93c2aee-0e7b-48e8-8bf3-79eb18221b11"
  client_secret   = "6vd8Q~OGdL499LSVhPuZEWjvrRYwPqZrOB0Ajazm"
}