resource "azurerm_key_vault" "example" {
  name                        = "alex-chui-kv"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.ARM_TENANT_ID
  sku_name                    = "standard"
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

}