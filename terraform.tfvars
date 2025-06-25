subscription_id              = "c9a64aa6-d430-43a8-a468-96c3018719cd"
resource_group_name         = "ashishtech"
location                   = "centralindia"
aks_cluster_name               = "aks-cluster"
dns_prefix                 = "aksdns"
kubernetes_version         = "1.21.2"
node_count                 = 3
node_vm_size               = "Standard_DS2_v2"
network_plugin             = "azure"
log_analytics_workspace_id = "/subscriptions/c9a64aa6-d430-43a8-a468-96c3018719cd/resourceGroups/aks-rg/providers/Microsoft.OperationalInsights/workspaces/demo-log-analytics"
chatui_namespace           = "chatui

#####Terraform Backend
storage_account_name = "ashishtechstorage"
container_name       = "tfstate"


