variable "sql_config" {
  description = "Azure SQL configuration object"
  type        = any
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "administrator_login" {
  description = "Azure SQL configuration map"
  type        = any
}

variable "administrator_login_password" {
  description = "Azure SQL configuration map"
  type        = any
}