resource "azurerm_subnet" "example" {
  name                 = var.subnet_config.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.subnet_config.vnet_key
  address_prefixes     = var.subnet_config.cidr
}