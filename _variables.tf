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

# variable "nsg_config" {    
# }
# variable "route_table_config" {    
# }

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