module "azure_aks" {
  source   = "./module/azure_aks"
  for_each = var.aks_config

  aks_config          = each.value          # 傳進去的是 "aks-01" 裡面那層
  subnet_id           = module.azure_subnet[each.value.subnet_key].id
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}