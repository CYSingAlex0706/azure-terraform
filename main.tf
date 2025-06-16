resource "azurerm_resource_group" "rg" {
  name     = "tf-test-123"
  location = "East Asia"
}

resource "azurerm_key_vault" "example" {
  name                        = "alex-chui-kv"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.ARM_TENANT_ID
  sku_name                    = "standard"
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

}

resource "azurerm_service_plan" "example" {
  name                = "test-app-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "test"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  app_settings        = {
    "Key" = "Value"
  }

  site_config {}
}