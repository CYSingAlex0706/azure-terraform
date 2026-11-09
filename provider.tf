terraform {
  required_version = ">= 1.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.1.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate-rg"
      storage_account_name = "alextftfstate12345"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
    }
}
# provider.tf
provider "azurerm" {
  features {}

  # 引用在 .tfvars 中定义的变量
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}