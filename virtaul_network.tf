module "azure_vnet" {
  source      = "./module/azure_virtaul_network"
  for_each    = var.vnet_config
  vnet_config = each.value

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "azure_subnet" {
  source   = "./module/azure_subnet"
  for_each = var.subnet_config

  # 显式拆解 each.value 并传给模块内部定义的变量
  subnet_config      = each.value
  nsg_config         = lookup(each.value, "nsg_config", null)
  route_table_config = lookup(each.value, "route_table_config", null)

  resource_group_name  = var.resource_group_name
  virtual_network_name = module.azure_vnet["vpc-01"].vnet_name
  location             = var.location
}