resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_config.name
  address_space       = var.vnet_config.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  # dynamic "subnet" {
  #   for_each = { for subnet in var.vent_config.subnet_config : subnet.name => subnet }
    
  #   content {
  #     name              = subnet.value.name
  #     address_prefixes  = [subnet.value.address_prefix]
  #   }
  # }
}