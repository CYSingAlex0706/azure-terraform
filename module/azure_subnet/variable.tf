variable "virtual_network_name" {
  description = "Azure区域"
  type        = string
}

variable "subnet_config" {
}

variable "resource_group_name" {
  description = "资源组名称"
  type        = string
}

variable "location" {
  description = "Azure区域"
  type        = string
}

variable "nsg_config" {
  description = "网络安全组配置"
  type = object({
    name  = string
    rules = optional(map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })))
  })
  default = null
}

variable "route_table_config" {
  description = "路由表配置"
  type = object({
    name   = string
    routes = optional(map(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    })))
  })
  default = null
}



