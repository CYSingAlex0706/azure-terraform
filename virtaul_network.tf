module "azure_vnet" {
  source      = "./module/azure_virtaul_network"
  for_each    = var.vnet_config
  vnet_config = each.value

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "azure_subnet" {
  source        = "./module/azure_subnet"
  for_each      = var.subnet_config
  subnet_config = each.value

  resource_group_name  = var.resource_group_name
  virtual_network_name = module.azure_vnet["vpc-01"].vnet_name
  location             = var.location
}