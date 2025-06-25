resource "azurerm_kubernetes_cluster" "aks" {
  name                            = var.cluster_name
  location                        = var.location
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  resource_group_name             = var.resource_group_name
  dns_prefix                      = var.dns_prefix
  kubernetes_version              = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  # RBAC removed here



  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = "standard"
  }

  tags = var.tags
}

resource "kubernetes_namespace" "chat_namespace" {
  metadata {
    name = var.chatui_namespace
  }
}

