variable "aks_config" {
  description = "AKS configuration object"
  type        = any
}

variable "subnet_id" {
  description = "Subnet ID for AKS node pool"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}