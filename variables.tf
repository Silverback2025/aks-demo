variable "resource_group_name" {
  default = "aks-rg"
}

variable "subscription_id" {
  description = "The Azure Subscription ID to deploy resources into"
  type        = string
}

variable "location" {
  default = "westeurope"
}

variable "aks_cluster_name" {
  default = "aks-cluster"
} 

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  type        = string
}

variable "chatui_namespace" {
  description = "Namespace for Chat UI"
  type        = string
  default     = "chatui"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "network_plugin" {
  description = "Network plugin to use"
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "Load Balancer SKU"
  type        = string
  default     = "standard"
}

variable "oms_agent_enabled" {
  description = "Enable OMS Agent"
  type        = bool
  default     = true
}

variable "oms_agent_workspace_id" {
  description = "Workspace ID for OMS Agent"
  type        = string
  default     = ""
}

variable "identity_type" {
  description = "Identity type for the cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "addon_profile" {
  description = "Addon profile for AKS"
  type        = any
  default     = {}
}

variable "network_profile" {
  description = "Network profile settings"
  type        = any
  default     = {}
}

variable "kube_config" {
  description = "Kube config"
  type        = any
  default     = null
}

variable "kube_config_context" {
  description = "Kube config context"
  type        = string
  default     = ""
}

variable "kube_config_path" {
  description = "Kube config path"
  type        = string
  default     = ""
}

variable "kube_config_content" {
  description = "Kube config content"
  type        = string
  default     = ""
}

variable "kube_config_sensitive" {
  description = "Sensitive kube config flag"
  type        = bool
  default     = false
}

variable "kube_config_output" {
  description = "Output kube config flag"
  type        = bool
  default     = true
}

variable "aks_version" {
  description = "AKS version"
  type        = string
  default     = "1.25.0"
}

variable "admin_group_object_ids" {
  description = "Admin group object IDs for RBAC"
  type        = list(string)
  default     = []
}

variable "enable_azure_rbac" {
  description = "Enable Azure RBAC"
  type        = bool
  default     = false
}

variable "azure_rbac_enabled" {
  description = "Azure RBAC enabled flag"
  type        = bool
  default     = false
}

variable "azure_rbac_mode" {
  description = "Azure RBAC mode"
  type        = string
  default     = ""
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "node_vm_size" {
  description = "Size of the virtual machines in the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}
