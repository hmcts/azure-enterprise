resource "azuread_group" "user_access_administrator" {
  for_each = var.groups

  display_name            = "DTS User Access Administrators (mg:${each.value.id})"
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azurerm_role_assignment" "user_access_administrators" {
  for_each = {
    for k, v in var.groups : k => v
  }

  principal_id         = azuread_group.user_access_administrator[each.value.id].object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${each.value.id}"
  role_definition_name = try(each.value.user_access_administrator_role, "User Access Administrator")
}

