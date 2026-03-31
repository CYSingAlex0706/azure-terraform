# 创建子网
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_config.name
  address_prefixes     = var.subnet_config.cidr
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

# 创建网络安全组（如果配置了）
resource "azurerm_network_security_group" "nsg" {
  count = var.nsg_config != null ? 1 : 0
  
  name                = var.nsg_config.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsg_config.rules != null ? var.nsg_config.rules : {}
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

# 创建路由表（如果配置了）
resource "azurerm_route_table" "route_table" {
  count = var.route_table_config != null ? 1 : 0
  
  name                = var.route_table_config.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "route" {
    for_each = var.route_table_config.routes != null ? var.route_table_config.routes : {}
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
}

# 关联NSG到子网
resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  count = var.nsg_config != null ? 1 : 0
  
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg[0].id
}

# 关联路由表到子网
resource "azurerm_subnet_route_table_association" "route_assoc" {
  count = var.route_table_config != null ? 1 : 0
  
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table[0].id
}