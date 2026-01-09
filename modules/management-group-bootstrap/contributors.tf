# Derive environment from management group context - NO environment variable needed
locals {
  # Auto-detect if we're in sandbox based on group names
  is_sandbox = anytrue([
    for k, mg in var.groups : 
    can(regex("(?i)(sandbox|sbox)", mg.display_name))
  ])
  
  platform_ops_group_id = local.is_sandbox ? "9b200a9c-8c0b-497a-9246-2c9b4dcc0d02" :  "e7ea2042-4ced-45dd-8ae3-e051c6551789"
}

# Lookup Platform Operations SC group
data "azuread_group" "platform_ops" {
  object_id = local.platform_ops_group_id
}

# Filter out production management groups
locals {
  mg_non_prod = {
    for k, mg in var.groups :
    k => {
      id           = k
      display_name = mg.display_name
    }
    if can(regex("(?i)(non[- ]?production|sandbox)", mg.display_name))
  }

  contributors_non_prod = {
    for k, g in azuread_group.contributors :
    k => g
    if contains(keys(local.mg_non_prod), k)
  }
}

# Add Platform Operations as member
resource "azuread_group_member" "platform_ops_in_non_prod_contributors" {
  for_each = local.contributors_non_prod
  
  group_object_id  = each.value.object_id
  member_object_id = data.azuread_group.platform_ops.object_id
  
  lifecycle {
    create_before_destroy = true
  }
}