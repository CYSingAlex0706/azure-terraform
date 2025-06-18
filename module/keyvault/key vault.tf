resource "azurerm_key_vault" "example" {
  name                      = "alex-chui-kv"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  tenant_id                 = var.ARM_TENANT_ID
  sku_name                  = "standard"
  purge_protection_enabled  = false
  enable_rbac_authorization = true

}