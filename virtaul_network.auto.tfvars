vnet_config = {
  "vpc-01" = {
    name          = "testing-vnet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_config = {
  "subnet-01" = {
    name = "subnet-01"
    cidr = ["10.0.1.0/24"]
    
    nsg_config = {
      name = "subnet01-nsg"
      rules = {
        "ssh" = {
          name                       = "SSH"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "22"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
        "rdp" = {
          name                       = "RDP"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "3389"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      }
    }
    
    route_table_config = {
      name = "subnet01-rt"
      routes = {
        "default" = {
          name           = "to-internet"
          address_prefix = "0.0.0.0/0"
          next_hop_type  = "Internet"
        }
        "vnet-peering" = {
          name           = "to-peered-vnet"
          address_prefix = "10.1.0.0/16"
          next_hop_type  = "VirtualAppliance"
          next_hop_in_ip_address = "10.0.100.4"
        }
      }
    }
  }
  
  "subnet-02" = {
    name = "subnet-02"
    cidr = ["10.0.2.0/24"]
    
    nsg_config = {
      name = "subnet02-nsg"
      rules = {
        "web" = {
          name                       = "HTTP"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "80"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
        "web-ssl" = {
          name                       = "HTTPS"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      }
    }
    # 没有route_table_config，表示不创建路由表
  }
  
  "subnet-03" = {
    name = "subnet-03"
    cidr = ["10.0.3.0/24"]
    # 既没有nsg_config也没有route_table_config，只创建子网
  }
  
  "subnet-04" = {
    name = "subnet-04"
    cidr = ["10.0.4.0/24"]
    
    route_table_config = {
      name = "subnet04-rt"
      routes = {
        "firewall" = {
          name           = "to-firewall"
          address_prefix = "0.0.0.0/0"
          next_hop_type  = "VirtualAppliance"
          next_hop_in_ip_address = "10.0.100.4"
        }
      }
    }
    # 没有nsg_config，表示不创建NSG
  }
}