data "azuread_group" "platform_ops" {
  count     = length(local.contributors_non_prod) > 0 && var.platform_operations != null ? 1 : 0
  object_id = var.platform_operations
}

locals {
  mg_non_prod = {
    for k, mg in var.groups :
    k => {
      id           = k
      display_name = mg.display_name
    }
    if can(regex("(?i)(sandbox)", mg.display_name))
  }

  contributors_non_prod = {
    for k, g in azuread_group.contributors :
    k => g
    if contains(keys(local.mg_non_prod), k)
  }
}

resource "azuread_group_member" "platform_ops_in_non_prod_contributors" {
  for_each         = local.contributors_non_prod
  group_object_id  = each.value.object_id
  member_object_id = data.azuread_group.platform_ops[0].object_id
}