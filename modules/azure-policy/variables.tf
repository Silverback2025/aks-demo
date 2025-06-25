variable "policy_definition_id" {
  description = "Azure Policy definition ID"
  type        = string
}

variable "policy_assignment_name" {
  description = "Name of the policy assignment"
  type        = string
}

variable "scope" {
  description = "Scope at which the policy will be assigned (subscription, resource group, etc.)"
  type        = string
}

variable "parameters" {
  description = "Parameters for the policy assignment"
  type        = map(any)
  default     = {}
}
