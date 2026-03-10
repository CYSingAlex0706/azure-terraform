# NSG 配置 - 支持多个 NSG
nsg_config = {
  nsg_01 = {
    name = "jenkins-nsg"
    security_rules = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "218.102.0.125/32"  # 你的 IP
        destination_address_prefix = "*"
      },
      {
        name                       = "Jenkins"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "218.102.0.125/32"  # 你的 IP
        destination_address_prefix = "*"
      }
    ]
  }
}