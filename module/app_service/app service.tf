resource "azurerm_service_plan" "example" {
  name                = "test-app-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "ac-uat-test01"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.example.id
  app_settings = {
    "Key" = "Value"
  }

  site_config {}
}