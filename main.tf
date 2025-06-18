module "rg" {
 source = "./resource group"
 name = var.resource_group_name
 location = var.location
}

module "app_service" {
 source = "./app service"
 name = var.resource_group_name
 location = var.location
}

module "keyvault" {
 source = "./keyvault"
 name = var.resource_group_name
 location = var.location
}