resource "azurerm_resource_group" "rg" {
  name     = "tf-test-123"
  location = "East Asia"
}

resource "azurerm_key_vault" "example" {
  name                        = "example-kv"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = false
  enable_rbac_authorization   = false

}

