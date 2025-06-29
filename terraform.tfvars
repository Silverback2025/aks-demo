subscription_id            = "c9a64aa6-d430-43a8-a468-96c3018719cd"
resource_group_name        = "ashishtech"
location                   = "centralindia"
aks_cluster_name           = "aks-cluster"
dns_prefix                 = "aksdns"
kubernetes_version         = "1.30.2"
load_balancer_sku          = "standard"
oms_agent_enabled          = true
oms_agent_workspace_id     = "/subscriptions/c9a64aa6-d430-43a8-a468-96c3018719cd/resourceGroups/ashishtech/providers/Microsoft.OperationalInsights/workspaces/demo"
node_count                 = 3
node_vm_size               = "Standard_DS2_v2"
network_plugin             = "azure"
log_analytics_workspace_id = "/subscriptions/c9a64aa6-d430-43a8-a468-96c3018719cd/resourceGroups/aks-rg/providers/Microsoft.OperationalInsights/workspaces/demo-log-analytics"
chatui_namespace           = "chatui"


identity_type          = "SystemAssigned"
addon_profile          = {}
network_profile        = {}
kube_config            = null
kube_config_context    = ""
kube_config_path       = ""
kube_config_content    = ""
kube_config_sensitive  = false
kube_config_output     = true
admin_group_object_ids = []
enable_azure_rbac      = false
azure_rbac_enabled     = false
azure_rbac_mode        = ""

vm_size = "Standard_B2s"


api_server_authorized_ip_ranges = [""]
min_tls_version                 = "TLS1_2"


#####Terraform Backend
storage_account_name = "ashishtechstorage"
container_name       = "tfstate"


