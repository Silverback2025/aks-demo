resource "azurerm_policy_assignment" "this" {
  name                 = var.policy_assignment_name
  scope                = var.scope
  policy_definition_id = var.policy_definition_id
  parameters           = var.parameters
}
