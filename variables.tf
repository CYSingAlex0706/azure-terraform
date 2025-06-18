variable "TFC_AZURE_RUN_CLIENT_ID" {
  type = string
}

variable "TFC_AZURE_PROVIDER_AUTH" {
  type = string
}

variable "ARM_TENANT_ID" {
  type = string
}

variable "ARM_SUBSCRIPTION_ID" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
}
