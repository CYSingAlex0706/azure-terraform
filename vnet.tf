module "azure_vnet" {
  source      = "./module/vnet"
  for_each    = var.vnet_config
  vnet_config = each.value

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "azure_subnet" {
  source   = "./module/azure_subnet"
  for_each = var.subnet_config
  virtual_network_name           = module.azure_vnet["vpc-01"].vnet_name
  subnet_config       = each.value
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}