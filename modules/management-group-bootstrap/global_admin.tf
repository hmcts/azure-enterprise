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

# Assign Owner role to the active group
resource "azurerm_role_assignment" "global_admin_owner" {
  principal_id         = azuread_group.global_admin.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${var.root_parent_id}"
  role_definition_name = "Owner"
}

# Assign User Access Administrator role to the active group
resource "azurerm_role_assignment" "global_admin_user_access" {
  principal_id         = azuread_group.global_admin.object_id
  scope                = "/providers/Microsoft.Management/managementGroups/${var.root_parent_id}"
  role_definition_name = "User Access Administrator"
}
