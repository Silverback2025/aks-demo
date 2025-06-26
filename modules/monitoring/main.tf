

resource "azurerm_log_analytics_workspace" "log" {
  name                = "demo-log-analytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
resource "azurerm_monitor_diagnostic_setting" "aks_diagnostics" {
  name                       = "aks-diagnostics"
  target_resource_id         = var.cluster_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id

  enabled_log {
    category = "kube-apiserver"
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  enabled_log {
    category = "kube-controller-manager"
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  enabled_log {
    category = "kube-scheduler"
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
