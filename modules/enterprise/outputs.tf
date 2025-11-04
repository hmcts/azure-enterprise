output "custom_roles" {
  value = var.create_custom_roles == true ? azurerm_role_definition.custom_role_definitions : data.azurerm_role_definition.custom_role_definitions
}

output "platform_ops_non_prod_contributor_memberships" {
  description = "Map of Platform Operations SC memberships into non-prod DTS Contributors groups."
  value = {
    for k, v in try(azuread_group_member.platform_ops_in_non_prod_contributors, {}) :
    k => {
      group_object_id  = v.group_object_id
      member_object_id = v.member_object_id
      id               = v.id
    }
  }
}
