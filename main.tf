module "rg" {
 source = "./rg"
 name = var.resource_group_name
 location = var.location
}

module "app_service" {
 source = "./rg"
 name = var.resource_group_name
 location = var.location
}
