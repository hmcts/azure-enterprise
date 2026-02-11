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

