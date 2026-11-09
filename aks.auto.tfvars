aks_config = {
  "aks-01" = {
    name              = "tf-aks-cluster-01"
    dns_prefix        = "tfaks01"
    kubernetes_version      = "1.34.7"
    sku_tier          = "Free"
    identity_type     = "SystemAssigned"
    subnet_key        = "aks-subnet"
    enable_azure_rbac = false
    oidc_issuer_enabled = true

    default_node_pool = {
      name                = "system"
      node_count          = 1
      vm_size             = "Standard_B2s"
      os_disk_size_gb     = 30
      type                = "VirtualMachineScaleSets"
      enable_auto_scaling = false
      max_pods            = 30
    }

    network_profile = {
      network_plugin    = "azure"
      network_policy    = "azure"
      load_balancer_sku = "standard"
      service_cidr   = "172.20.0.0/16"
      dns_service_ip = "172.20.0.10"
      outbound_type     = "loadBalancer"
    }

    additional_node_pools = {}

    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }
}