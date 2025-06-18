module "rg" {
  source              = "./module/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app_service" {
  source              = "./module/app_service"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "keyvault" {
  source              = "./module/keyvault"
  resource_group_name = var.resource_group_name
  location            = var.location
  ARM_TENANT_ID       = var.ARM_TENANT_ID
}