resource "azurerm_service_plan" "example" {
  name                = "test-app-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "ac-uat-test01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  app_settings        = {
    "Key" = "Value"
  }

  site_config {}
}