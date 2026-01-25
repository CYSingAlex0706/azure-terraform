resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_config.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_config.size
  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = var.vm_config.disable_password_authentication

  network_interface_ids = [
    azurerm_network_interface.vm.id,
  ]
  
  os_disk {
    caching              = var.vm_config.os_disk.caching
    storage_account_type = var.vm_config.os_disk.storage_account_type
    disk_size_gb         = var.vm_config.os_disk.disk_size_gb
  }
  
  source_image_reference {
    publisher = var.vm_config.image.publisher
    offer     = var.vm_config.image.offer
    sku       = var.vm_config.image.sku
    version   = var.vm_config.image.version
  }
  
  # admin_ssh_key{
  #   username   = var.vm_config.username
  #   public_key = var.vm_config.public_key
  # }
}

resource "azurerm_network_interface" "vm" {
  name                = "${var.vm_config.name}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id  # 使用 subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}