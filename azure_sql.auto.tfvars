sql_config = {
  "sql-01" = {
    server_name                  = "tf-sql-server-01"   # 全域唯一，小寫
    version                      = "12.0"
    minimum_tls_version          = "1.2"
    public_network_access_enabled = true

    # 允許 Azure 服務存取（可選）
    azure_services_access = true

    # Firewall rules（可選）
    firewall_rules = {
      "my-ip" = {
        name             = "AllowMyIP"
        start_ip_address = "218.102.55.109"
        end_ip_address   = "218.102.55.109"
      }
    }

    databases = {
      "appdb" = {
        name                        = "properties-db"
        collation                   = "SQL_Latin1_General_CP1_CI_AS"
        max_size_gb                 = 2
        sku_name                    = "Basic"          # Basic / S0 / S1 / GP_S_Gen5_2 等
        zone_redundant              = false
        storage_account_type        = "Local"
        auto_pause_delay_in_minutes = null             # Serverless 才用
        min_capacity                = null             # Serverless 才用
      }
    }

    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }
}