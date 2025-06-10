data "azurerm_resource_group" "rgname" {
  name = var.resource_group
}

resource "random_integer" "main" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_account" "strgname" {
  name                = "${var.storage_account}${random_integer.main.result}"
  resource_group_name = data.azurerm_resource_group.rgname.name
  location            = data.azurerm_resource_group.rgname.location

  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  enable_https_traffic_only = true
  
  blob_properties {
    last_access_time_enabled = true
  }
 
}

/*
resource "azapi_update_resource" "local_user" {
  type        = "Microsoft.Storage/storageAccounts@2021-09-01"
  resource_id = azurerm_storage_account.strgname.id

  body = jsonencode({
    properties = {
      isLocalUserEnabled = false
    }
  })
}
resource "azapi_resource" "cold_storage_policy" {
  type      = "Microsoft.Storage/storageAccounts/managementPolicies@2023-01-01"
  name      = "default"
  parent_id = azurerm_storage_account.strgname.id

  body = jsonencode({
    properties = {
      policy = {
        rules = [
          {
            name    = "default"
            enabled = true
            type    = "Lifecycle"
            definition = {
              filters = {
                blobTypes = ["blockBlob"]
              }
              actions = {
                baseBlob = {
                  tierToCold = {
                    daysAfterLastAccessTimeGreaterThan = 90
                  }
                  tierToCool = {
                    daysAfterLastAccessTimeGreaterThan = 365
                  }
                }
              }
            }
          }
      ] }
    }
  })
}
*/

resource "azurerm_storage_management_policy" "policy1" {
  storage_account_id = azurerm_storage_account.strgname.id
  rule {
    name = "policy1"
  enabled = true
    filters {
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_last_access_time_greater_than = 90
        tier_to_archive_after_days_since_last_access_time_greater_than = 365
      }
    }
  }
}