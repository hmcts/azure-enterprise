resource "azuread_group" "groups" {
  for_each                = local.groups
  display_name            = each.value.name
  description             = each.value.description
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azuread_group_member" "members" {
  for_each         = local.members_list
  group_object_id  = azuread_group.groups[each.value.role].object_id
  member_object_id = each.value.member
}

resource "azuread_group_member" "dts_operation_members" {
  group_object_id  = data.azuread_group.dts_operations.object_id
  member_object_id = azuread_service_principal.sp.object_id
}

locals {
  create_contributor_eligible = !strcontains(lower(azurerm_subscription.this.subscription_name), "sandbox") && !strcontains(lower(azurerm_subscription.this.subscription_name), "sbox")
}

resource "azuread_group" "contributor_eligible" {
  for_each = local.create_contributor_eligible ? {
    "Contributor Eligible" = {
      name        = "DTS Contributors Eligible (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Holds users eligible for Contributor access via access packages for ${azurerm_subscription.this.subscription_name} subscription."
    }
  } : {}

  display_name            = each.value.name
  description             = each.value.description
  prevent_duplicate_names = true
  security_enabled        = true
}
