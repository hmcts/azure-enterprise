# Keep the original groups resource unchanged
resource "azuread_group" "groups" {
  for_each                = local.groups
  display_name            = each. value.name
  description             = each.value.description
  prevent_duplicate_names = true
}

# Add a new resource for conditional groups
resource "azuread_group" "conditional_groups" {
  for_each                = local.conditional_groups
  display_name            = each. value.name
  description             = each.value.description
  prevent_duplicate_names = true
}