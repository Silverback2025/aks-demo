variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster is deployed."
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID for monitoring."
  type        = string
  default     = ""
}

variable "chatui_namespace" {
  description = "Namespace for HuggingFace Chat UI deployment"
  type        = string
  default     = "chatui"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "aksdns"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
  default     = "1.21.2"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "network_plugin" {
  description = "Network plugin for the AKS cluster"
  type        = string
  default     = "azure"
}
variable "load_balancer_sku" {
  description = "Load balancer SKU for the AKS cluster"
  type        = string
  default     = "standard"
}

variable "oms_agent_enabled" {
  description = "Enable OMS agent for AKS monitoring"
  type        = bool
  default     = true
}
variable "oms_agent_workspace_id" {
  description = "Log Analytics workspace ID for OMS agent"
  type        = string
  default     = ""
}

variable "identity_type" {
  description = "Type of identity for the AKS cluster"
  type        = string
  default     = "SystemAssigned"
}
variable "addon_profile" {
  description = "Addon profile for the AKS cluster"
  type        = map(any)
  default     = {}
}
variable "network_profile" {
  description = "Network profile for the AKS cluster"
  type        = map(any)
  default     = {}
}
variable "kube_config" {
  description = "Kube config for the AKS cluster"
  type        = string
  default     = ""
}

variable "kube_config_context" {
  description = "Kubeconfig context for the AKS cluster"
  type        = string
  default     = ""
}
variable "kube_config_path" {
  description = "Path to the kubeconfig file for the AKS cluster"
  type        = string
  default     = "~/.kube/config"
}
variable "kube_config_content" {
  description = "Content of the kubeconfig file for the AKS cluster"
  type        = string
  default     = ""
}
variable "kube_config_sensitive" {
  description = "Whether the kubeconfig content is sensitive"
  type        = bool
  default     = false
}

variable "kube_config_output" {
  description = "Output for the kubeconfig"
  type        = string
  default     = ""
}
variable "aks_version" {
  description = "Version of the AKS cluster"
  type        = string
  default     = "1.21.2"
}

variable "api_server_authorized_ip_ranges" {
  description = "List of IP ranges allowed to access the AKS API server"
  type        = list(string)
  default     = []  # Optional: or set to null if you'd rather require it
}
