# storage_config = {
#   "tfstate" = {
#     # Storage account name must be globally unique, 3-24 lowercase alphanumeric
#     name                     = "alextest12345"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"       # LRS / GRS / RAGRS / ZRS
#     account_kind             = "StorageV2"
#     min_tls_version          = "TLS1_2"

#     # Security best practices for Terraform state
#     allow_nested_items_to_be_public = false
#     shared_access_key_enabled       = true
#     versioning_enabled              = true
#     blob_delete_retention_days      = 14
#     container_delete_retention_days = 7

#     containers = {
#       "tfstate" = {
#         name        = "tfstate"
#         access_type = "private"
#       }
#     }

#     tags = {
#       purpose    = "terraform-state"
#       managed_by = "terraform"
#     }
#   }
# }