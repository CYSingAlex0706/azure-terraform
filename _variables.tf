# variable "TFC_AZURE_RUN_CLIENT_ID" {
#   type = string
# }

# variable "TFC_AZURE_PROVIDER_AUTH" {
#   type = string
# }

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "displayName" {
}

variable "tenant_id" {
}


variable "client_id" {
  description = "Azure Client ID (App ID)"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "nsg_config" {    
}


variable "vm_config" {
}
variable "subnet_config" {
}
variable "vnet_config" {
}

variable "ip_configs" {
}

variable "admin_username" {
  sensitive = true
}
variable "admin_password" {
  sensitive = true
}

# variable "nsg_config" {
#   description = "Map of NSG configurations"
#   type = map(object({
#     name = string
#     security_rules = list(object({
#       name                       = string
#       priority                   = number
#       direction                  = string
#       access                     = string
#       protocol                   = string
#       source_port_range          = string
#       destination_port_range     = string
#       source_address_prefix      = string
#       destination_address_prefix = string
#     }))
#     tags = optional(map(string))
#   }))
# }
