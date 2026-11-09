module "azure_sql" {
  source   = "./module/azure_sql"
  for_each = var.sql_config

  sql_config          = each.value
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  depends_on = [module.resource_group]
}