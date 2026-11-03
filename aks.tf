module "azure_aks" {
  source   = "./module/azure_aks"
  for_each = var.aks_config

  aks_config = each.value

  subnet_id           = module.azure_subnet[each.value.subnet_key].id
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  depends_on = [module.azure_vnet, module.azure_subnet]
}