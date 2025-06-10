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
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
}
