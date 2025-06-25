output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}
output "log_analytics_workspace_id" {
  value = module.monitoring.log_analytics_workspace_id
}