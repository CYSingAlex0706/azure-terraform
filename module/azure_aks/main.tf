resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_config.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_config.dns_prefix
  kubernetes_version        = try(var.aks_config.kubernetes_version, null)
  sku_tier            = try(var.aks_config.sku_tier, "Free")
  
  
  
api_server_access_profile {
    authorized_ip_ranges = ["218.102.55.109/32"]
  }

  default_node_pool {
    name                 = var.aks_config.default_node_pool.name
    node_count           = var.aks_config.default_node_pool.node_count
    vm_size              = var.aks_config.default_node_pool.vm_size
    vnet_subnet_id       = var.subnet_id
    os_disk_size_gb      = try(var.aks_config.default_node_pool.os_disk_size_gb, 30)
    type                 = try(var.aks_config.default_node_pool.type, "VirtualMachineScaleSets")
    auto_scaling_enabled = try(var.aks_config.default_node_pool.enable_auto_scaling, false)
    min_count            = try(var.aks_config.default_node_pool.min_count, null)
    max_count            = try(var.aks_config.default_node_pool.max_count, null)
    max_pods             = try(var.aks_config.default_node_pool.max_pods, 30)
    orchestrator_version = try(var.aks_config.default_node_pool.orchestrator_version, null)
  }

  identity {
    type = try(var.aks_config.identity_type, "SystemAssigned")
  }

  network_profile {
    network_plugin    = try(var.aks_config.network_profile.network_plugin, "azure")
    network_policy    = try(var.aks_config.network_profile.network_policy, "azure")
    load_balancer_sku = try(var.aks_config.network_profile.load_balancer_sku, "standard")
    service_cidr      = try(var.aks_config.network_profile.service_cidr, "10.1.0.0/16")
    dns_service_ip    = try(var.aks_config.network_profile.dns_service_ip, "10.1.0.10")
    outbound_type     = try(var.aks_config.network_profile.outbound_type, "loadBalancer")
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = try(var.aks_config.enable_azure_rbac, false) ? [1] : []
    content {
      azure_rbac_enabled     = true
      admin_group_object_ids = try(var.aks_config.admin_group_object_ids, [])
    }
  }

  tags = try(var.aks_config.tags, {})
}

resource "azurerm_kubernetes_cluster_node_pool" "additional" {
  for_each = try(var.aks_config.additional_node_pools, {})

  name                  = each.value.name
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.aks.id
  vm_size               = each.value.vm_size
  node_count            = try(each.value.node_count, 1)
  vnet_subnet_id        = var.subnet_id
  os_disk_size_gb       = try(each.value.os_disk_size_gb, 30)
  auto_scaling_enabled  = try(each.value.enable_auto_scaling, false)
  min_count             = try(each.value.min_count, null)
  max_count             = try(each.value.max_count, null)
  max_pods              = try(each.value.max_pods, 30)
  mode                  = try(each.value.mode, "User")
  orchestrator_version  = try(each.value.orchestrator_version, null)
  tags                  = try(each.value.tags, {})
}