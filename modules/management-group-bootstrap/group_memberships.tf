# Lookup Platform Operations SC group

# Filter out production management groups
locals {
  mg_non_prod = {
    for k, mg in var.groups :
    k => {
      id           = k
      display_name = mg.display_name
    }
    # to exclude production management groups including those top-level ones HMCTS, CFT, SDS, Platform, Security,
    # Crime, and Heritage
    # DTSPO-29259-contributor only on sandbox going forward
    if can(regex("(?i)(sandbox)", mg.display_name))
  }

  contributors_non_prod = {
    for k, g in azuread_group.contributors :
    k => g
    if contains(keys(local.mg_non_prod), k)
  }
}

# Add Platform Operations as member (to sandbox only)
resource "azuread_group_member" "platform_ops_in_non_prod_contributors" {
  for_each         = local.contributors_non_prod
  group_object_id  = each.value.object_id
  member_object_id = data.azuread_group.platform_ops.object_id
}
