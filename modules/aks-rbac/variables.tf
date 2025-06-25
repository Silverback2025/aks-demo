variable "scope" {
  description = "Scope for the RBAC role assignment (e.g., AKS cluster resource ID)"
  type        = string
}


variable "enable_azure_rbac" {
  description = "Enable Azure RBAC for the AKS cluster"
  type        = bool
  default     = false
}
variable "azure_rbac_enabled" {
  description = "Whether Azure RBAC is enabled for the AKS cluster"
  type        = bool
  default     = false
}
variable "azure_rbac_mode" {
  description = "Mode for Azure RBAC in the AKS cluster"
  type        = string
  default     = "System"
}
variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID for monitoring."
  type        = string
  default     = ""
}
variable "chatui_namespace" {
  description = "Namespace for the ChatUI application in AKS"
  type        = string
  default     = "chatui"
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "Azure AD group IDs for admin access"
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = ""
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "Azure AD group object IDs to be assigned Kubernetes RBAC roles"
}
