variable "resource_group_name" {}
variable "location" {}


variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID for monitoring."
  type        = string
  default     = "7ed79e7c-3eba-4e61-a8d7-09bea3880e92"
}

variable "cluster_id" {
  description = "AKS Cluster Resource ID"
  type        = string
}
