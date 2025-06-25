
module "backend_storage" {
  source               = "./modules/terraform-backend-storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = var.resource_group_name
  cluster_id          = module.aks.cluster_id
  location            = var.location
}

module "bootstrap" {
  source              = "./modules/bootstrap"
  resource_group_name = var.resource_group_name
  aks_cluster_name    = module.aks.cluster_name
  depends_on          = [module.aks]
}

module "aks" {
  source = "./modules/aks" # path to your aks module folder

  resource_group_name             = var.resource_group_name
  location                        = var.location
  log_analytics_workspace_id      = module.monitoring.log_analytics_workspace_id
  chatui_namespace                = var.chatui_namespace
  cluster_name                    = var.aks_cluster_name
  node_count                      = var.node_count
  node_vm_size                    = var.vm_size
  network_plugin                  = var.network_plugin
  load_balancer_sku               = var.load_balancer_sku
  oms_agent_enabled               = var.oms_agent_enabled
  oms_agent_workspace_id          = var.oms_agent_workspace_id
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  identity_type                   = var.identity_type
  addon_profile                   = var.addon_profile
  network_profile                 = var.network_profile
  kube_config                     = var.kube_config
  kube_config_context             = var.kube_config_context
  kube_config_path                = var.kube_config_path
  kube_config_content             = var.kube_config_content
  kube_config_sensitive           = var.kube_config_sensitive
  kube_config_output              = var.kube_config_output
  aks_version                     = var.aks_version
}

module "aks_rbac" {
  source = "./modules/aks-rbac"

  aks_cluster_id         = module.aks.cluster_id
  admin_group_object_ids = var.admin_group_object_ids
  scope                  = module.aks.cluster_id
  enable_azure_rbac      = var.enable_azure_rbac
  azure_rbac_enabled     = var.azure_rbac_enabled
  azure_rbac_mode        = var.azure_rbac_mode
}

