resource "azurerm_role_assignment" "local_groups" {
  for_each             = local.groups
  scope                = "/subscriptions/${azurerm_subscription.this.subscription_id}"
  role_definition_name = each.key
  principal_id         = azuread_group.groups[each.key].id
}

resource "azurerm_role_assignment" "local_role_assignments" {
  for_each             = local.role_assignments
  scope                = each.value.scope
  role_definition_name = each.key
  principal_id         = each.value.principal_id

}

resource "azurerm_role_assignment" "local_custom_role_assignments" {
  for_each           = { for k, v in var.custom_roles : k => v if keys(local.custom_role_assignments, v) }
  scope              = local.custom_role_assignments[each.key].scope
  role_definition_id = each.value.role_definition_id
  principal_id       = local.custom_role_assignments[each.key].principal_id
}

data "azurerm_role_definition" "custom_role_definitions" {
  for_each           = [for k, v in var.custom_roles : v if keys(local.custom_role_assignments, v)]
  role_definition_id = each.value

}
