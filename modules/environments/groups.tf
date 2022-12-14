resource "azuread_group" "groups" {
  for_each                = local.groups
  display_name            = each.value.name
  description             = each.value.description
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azuread_group_member" "members" {
  for_each         = local.groups
  group_object_id  = azuread_group.groups[each.key].object_id
  member_object_id = each.value.members
}

resource "azuread_group_member" "acr" {
  group_object_id  = data.azuread_group.acr.object_id
  member_object_id = azuread_group.groups["DTS Operations"].object_id
}

resource "azuread_group_member" "dns_zone_contributor" {
  group_object_id  = azuread_group.groups["DNS Zone Contributor"].object_id
  member_object_id = azuread_group.groups["DTS Operations"].object_id
}
