vm_config = {
  # Web服务器
  "web-vm" = {
    name = "web-server-01"
    size = "Standard_B1ms"
    
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
    }
    
    image = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
    
    disable_password_authentication = false
  }
  
}