# module "azure_storage_account" {
#   source   = "./module/azure_storage_account"
#   for_each = var.storage_config

#   storage_config      = each.value
#   resource_group_name = module.resource_group.resource_group_name
#   location            = var.location

#   depends_on = [module.resource_group]
# }