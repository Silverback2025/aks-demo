variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
  default     = "westeurope"
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name (lowercase, 3–24 chars)"
}

variable "container_name" {
  type        = string
  description = "Name of the blob container to hold the Terraform state"
}

