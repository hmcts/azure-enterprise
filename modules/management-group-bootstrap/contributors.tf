resource "azuread_group" "contributors" {
  for_each = var.groups

  display_name            = "DTS Contributors (mg:${each.value.id})"
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azurerm_role_assignment" "contributors" {
  for_each = {
    for k, v in var.groups : k => v
  }

  principal_id         = azuread_group.contributors[each.value.id].object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = each.value.contributor_role
}

# Data source to lookup the existing PIM approvers group
data "azuread_group" "pim_approvers" {
  display_name = "DTS Azure PIM Approvers (CNP)"
}

# Assign Contributor role to PIM Approvers group at Prod level for emergency access
resource "azurerm_role_assignment" "pim_approvers_contributor" {
  for_each = {
    for k, v in var.groups : k => v
    if v.contributor_role != "Contributor"
  }

  principal_id         = data.azuread_group.pim_approvers.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = "Contributor"
}

# Add Contributor role to nonprod management groups for PlatOps
data "azuread_group" "dts_platform_operations" {
  display_name = "DTS Platform Operations"
}

resource "azurerm_role_assignment" "platform_operations_contributor_nonprod" {
  for_each = {
    for k, v in var.groups : k => v
    if v.contributor_role == "Contributor"
  }

  principal_id         = data.azuread_group.dts_platform_operations.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = "Contributor"
}
