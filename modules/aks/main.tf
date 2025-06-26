resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version


  # Keep your existing configuration:
  api_server_access_profile {
    #    enable_private_cluster = false
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  sku_tier = "Standard"

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  # Explicitly disable Azure AD RBAC since you're managing it separately
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = false
    admin_group_object_ids = var.admin_group_object_ids
  }

  tags = var.tags
}
