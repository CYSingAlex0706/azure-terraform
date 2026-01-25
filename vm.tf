# main.tf (父模块)
module "azure_virtual_machine" {
  source   = "./module/azure_vm"
  for_each = var.vm_config

  vm_config = each.value

  # 关键：传递子网ID
  subnet_id = module.azure_subnet["subnet-01"].id
  public_ip_address_id   = module.azurerm_public_ip["web-vm-pip"].public_ip_address_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  depends_on = [module.azure_vnet]
}

module "azurerm_public_ip" {
  source              = "./module/azure_eip"
  for_each            = var.ip_configs
  ip_configs          = each.value
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}