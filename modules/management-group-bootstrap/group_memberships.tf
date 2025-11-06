# Lookup Platform Operations SC group
data "azuread_group" "platform_ops" {
  display_name = "DTS Platform Operations"
}

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
    if !can(regex("(?i)production", mg.display_name)) && !can(regex("(?i)^(hmcts|cft|sds|platform|security|crime|heritage)$", mg.display_name))
  }
}

# Lookup each non-prod DTS Contributors group
data "azuread_group" "dts_contributors_mg" {
  for_each     = local.mg_non_prod
  display_name = "DTS Contributors (mg:${each.value.id})"
}

# Add Platform Operations as member
resource "azuread_group_member" "platform_ops_in_non_prod_contributors" {
  for_each         = data.azuread_group.dts_contributors_mg
  group_object_id  = each.value.object_id
  member_object_id = data.azuread_group.platform_ops.object_id
}
