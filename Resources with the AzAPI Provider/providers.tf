terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "=3.70.0"
      version = "3.98.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azapi" {
  skip_provider_registration = true
}
