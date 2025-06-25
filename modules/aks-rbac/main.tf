resource "azurerm_role_assignment" "cluster_admins" {
  for_each            = toset(var.admin_group_object_ids)
  scope               = var.scope
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = each.value
}
