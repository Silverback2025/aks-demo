variable "resource_group_name" {
  description = "Resource group name"
  default     = "string"
}

variable "subscription_id" {
  description = "The Azure Subscription ID to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region"
  default     = "string"
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "string"
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  type        = string
}

variable "chatui_namespace" {
  description = "Namespace for Chat UI"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
}

variable "network_plugin" {
  description = "Network plugin to use"
  type        = string
}

variable "load_balancer_sku" {
  description = "Load Balancer SKU"
  type        = string
}

variable "oms_agent_enabled" {
  description = "Enable OMS Agent"
  type        = bool
}

variable "oms_agent_workspace_id" {
  description = "Workspace ID for OMS Agent"
  type        = string
}

variable "identity_type" {
  description = "Identity type for the cluster"
  type        = string
}

variable "addon_profile" {
  description = "Addon profile for AKS"
  type        = any
}

variable "managed_identity_client_id" {
  type = string
}

variable "network_profile" {
  description = "Network profile settings"
  type        = any
  default     = {}
}

variable "kube_config" {
  description = "Kube config"
  type        = any
}

variable "kube_config_context" {
  description = "Kube config context"
  type        = string
}

variable "kube_config_path" {
  description = "Kube config path"
  type        = string
}

variable "kube_config_content" {
  description = "Kube config content"
  type        = string
}

variable "kube_config_sensitive" {
  description = "Sensitive kube config flag"
  type        = bool
}

variable "kube_config_output" {
  description = "Output kube config flag"
  type        = bool
}


variable "admin_group_object_ids" {
  description = "Admin group object IDs for RBAC"
  type        = list(string)
}

variable "enable_azure_rbac" {
  description = "Enable Azure RBAC"
  type        = bool
}

variable "azure_rbac_enabled" {
  description = "Azure RBAC enabled flag"
  type        = bool
}

variable "azure_rbac_mode" {
  description = "Azure RBAC mode"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "node_vm_size" {
  description = "Size of the virtual machines in the default node pool"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account for backend"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container for backend state storage"
  type        = string
}

variable "api_server_authorized_ip_ranges" {
  description = "IP ranges allowed to access the AKS API server"
  type        = list(string)
  default     = []
}

variable "min_tls_version" {
  description = "Minimum TLS version for the storage account"
  type        = string
  default     = "TLS1_2"
}
