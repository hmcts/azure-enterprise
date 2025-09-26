resource "azuread_group" "contributors" {
  for_each = var.groups

  display_name            = "DTS Contributors (mg:${each.value.id})"
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azurerm_role_assignment" "contributors" {
  for_each = {
    for k, v in var.groups : k => v
    if v.environment_level != "prod"
  }

  principal_id         = azuread_group.contributors[each.value.id].object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = "Contributor"
}

# Data source to lookup the existing PIM approvers group
data "azuread_group" "pim_approvers" {
  display_name = "DTS Azure PIM Approvers (CNP)"
}

# Assign Contributor role to PIM Approvers group at Prod level for emergency access
resource "azurerm_role_assignment" "pim_approvers_contributor" {
  for_each = {
    for k, v in var.groups : k => v
    if v.environment_level == "prod"
  }

  principal_id         = data.azuread_group.pim_approvers.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = "Contributor"
}

# Assign Contributor role to Production groups and subscriptions
resource "azurerm_role_assignment" "production_contributor" {
  for_each = {
    for k, v in var.groups : k => v
    if v.environment_level == "prod"
  }

  principal_id         = azuread_group.contributors[each.value.id].object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = var.production_contributor_role
}

