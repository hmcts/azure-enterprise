locals {
  contributor_scopes = {
    for name, details in var.groups :
    name => "/providers/Microsoft.Management/managementGroups/${details.id}"
  }
}

resource "azuread_group" "contributors" {
  for_each = var.groups

  display_name            = "DTS Contributors (mg:${each.value.id})"
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azurerm_role_assignment" "contributors" {
  for_each = var.groups

  principal_id         = azuread_group.contributors[each.value.id].object_id
  scope                = local.contributor_scopes[each.key]
  role_definition_name = each.value.contributor_role
}

