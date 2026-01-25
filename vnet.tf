module "azure_vnet" {
  source              = "./module/vnet"
  for_each    = var.vnet_config
  vnet_config = each.value

  location            = var.location
  resource_group_name = var.resource_group_name
}

module "azure_subnet" {
  source = "./module/azure_subnet"
  for_each = var.subnet_config
  
  # 关键：从vnet模块获取实际VNet名称
  vnet_name           = module.azure_vnet[each.value.vnet_key]
  subnet_config       = each.value
  location            = var.location
  resource_group_name = var.resource_group_name
}