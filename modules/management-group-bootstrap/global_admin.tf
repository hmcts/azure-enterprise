# Roles to assign to the active global admin group
locals {
  global_admin_roles = [
    "Owner"
  ]
}

# Eligible Global Administrator Group
resource "azuread_group" "global_admin_eligible" {
  display_name            = "DTS Global Admins Eligible"
  description             = "Holds users eligible for Global Admin access via PIM access packages."
  prevent_duplicate_names = true
  security_enabled        = true
}

# Active Global Administrator Group
resource "azuread_group" "global_admin" {
  display_name            = "DTS Global Admins"
  description             = "Active Global Admins with Owner permissions at tenant root."
  prevent_duplicate_names = true
  security_enabled        = true
}

# Assign roles to the active group
resource "azurerm_role_assignment" "global_admin_roles" {
  for_each = toset(local.global_admin_roles)

  principal_id         = azuread_group.global_admin.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${var.root_parent_id}"
  role_definition_name = each.value
}
