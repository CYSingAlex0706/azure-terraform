module "azure_nsg" {
  source = "./module/azure_nsg"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  for_each = var.nsg_config
  nsg_config = each.value
  subnet_id           = module.azure_subnet["subnet-01"].id
}