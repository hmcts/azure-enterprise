# Eligible Contributors (SC) Group
resource "azuread_group" "contributors_sc_eligible" {
  display_name            = "DTS Platform Operations SC Eligible"
  description             = "Holds users eligible for Contributors SC access via PIM/access packages."
  prevent_duplicate_names = true
  security_enabled        = true
}

# Active Contributors (SC) Group
# todo need to import this/ made with clickops
# resource "azuread_group" "contributors_sc" {
#   display_name            = "DTS Platform Operations SC"
#   description             = "Members of Platform Operations team with Security Clearance"
#   prevent_duplicate_names = true
#   security_enabled        = true
# }

# Assign roles to the active group
# todo need to import this/ made with clickops
# resource "azurerm_role_assignment" "contributors_sc" {
#   principal_id         = azuread_group.contributors_sc.object_id
#   scope                = "/providers/Microsoft.Management/managementGroups/${var.root_parent_id}"
#   role_definition_name = "Contributor"
# }
