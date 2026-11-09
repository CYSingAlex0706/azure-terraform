resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_config.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = try(var.storage_config.account_tier, "Standard")
  account_replication_type = try(var.storage_config.account_replication_type, "LRS")
  account_kind             = try(var.storage_config.account_kind, "StorageV2")
  min_tls_version          = try(var.storage_config.min_tls_version, "TLS1_2")

  # Recommended for Terraform state
  allow_nested_items_to_be_public = try(var.storage_config.allow_nested_items_to_be_public, false)
  shared_access_key_enabled       = try(var.storage_config.shared_access_key_enabled, true)

  blob_properties {
    versioning_enabled = try(var.storage_config.versioning_enabled, true)

    dynamic "delete_retention_policy" {
      for_each = try(var.storage_config.blob_delete_retention_days, null) != null ? [1] : []
      content {
        days = var.storage_config.blob_delete_retention_days
      }
    }

    dynamic "container_delete_retention_policy" {
      for_each = try(var.storage_config.container_delete_retention_days, null) != null ? [1] : []
      content {
        days = var.storage_config.container_delete_retention_days
      }
    }
  }

  tags = try(var.storage_config.tags, {})
}

resource "azurerm_storage_container" "tfstate" {
  for_each = try(var.storage_config.containers, {})

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = try(each.value.access_type, "private")
}