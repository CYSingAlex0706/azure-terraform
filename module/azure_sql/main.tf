resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_config.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = try(var.sql_config.version, "12.0")
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = try(var.sql_config.minimum_tls_version, "1.2")
  public_network_access_enabled = try(var.sql_config.public_network_access_enabled, true)

  tags = try(var.sql_config.tags, {})
}

# 允許 Azure 服務存取
resource "azurerm_mssql_firewall_rule" "allow_azure" {
  count = try(var.sql_config.azure_services_access, false) ? 1 : 0

  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# 自訂 Firewall rules
resource "azurerm_mssql_firewall_rule" "custom" {
  for_each = try(var.sql_config.firewall_rules, {})

  name             = each.value.name
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

# Databases
resource "azurerm_mssql_database" "db" {
  for_each = try(var.sql_config.databases, {})

  name         = each.value.name
  server_id    = azurerm_mssql_server.sql.id
  collation    = try(each.value.collation, "SQL_Latin1_General_CP1_CI_AS")
  max_size_gb  = try(each.value.max_size_gb, 2)
  sku_name     = try(each.value.sku_name, "Basic")
  zone_redundant = try(each.value.zone_redundant, false)

  storage_account_type = try(each.value.storage_account_type, "Local")

  # Serverless 選項（有設才生效）
  auto_pause_delay_in_minutes = try(each.value.auto_pause_delay_in_minutes, null)
  min_capacity                = try(each.value.min_capacity, null)

  tags = try(var.sql_config.tags, {})
}