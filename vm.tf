# main.tf (父模块)
module "azure_virtual_machine" {
  source = "./module/azure_vm"
  for_each = var.vm_config
  
  vm_config = each.value
  
  # 关键：传递子网ID
  subnet_id = module.azure_subnet["subnet-01"].id
  
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  resource_group_name = var.resource_group_name
  location            = var.location
  
  depends_on = [module.azure_vnet]
}