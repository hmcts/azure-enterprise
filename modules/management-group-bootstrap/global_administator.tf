# Eligible Global Administrator Group
resource "azuread_group" "global_admin_eligible" {
  display_name            = "DTS Global Admin Eligible"
  description             = "Holds users eligible for Global Admin access via PIM access packages."
  prevent_duplicate_names = true
  security_enabled        = true
}

# Active Global Administrator Group
resource "azuread_group" "global_admin" {
  display_name            = "DTS Global Administrators"
  description             = "Active Global Administrators with Owner permissions at tenant root."
  prevent_duplicate_names = true
  security_enabled        = true
}

# Assign Owner role to the active group
resource "azurerm_role_assignment" "global_admin" {
  principal_id         = azuread_group.global_admin.object_id
  scope                = data.azurerm_client_config.current.tenant_id
  role_definition_name = "Owner"
}

# Required data source for tenant ID
data "azurerm_client_config" "current" {}
