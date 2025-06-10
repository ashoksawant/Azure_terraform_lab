terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

provider "azurerm" {
  features {}

  # Disable automatic registration of resource providers
  resource_provider_registrations = "none"

  # Set your Azure subscription ID
  subscription_id = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
}
