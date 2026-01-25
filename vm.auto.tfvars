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
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    disable_password_authentication = false
  }
}

ip_configs = {
  "web-vm-pip" = {
    name              = "web-vm-public-ip"
    allocation_method = "Static"
    sku               = "Standard"
  }
  # 可以为每个 VM 定义不同的公共 IP 配置
}