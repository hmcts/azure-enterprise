data "azuread_group" "aks_global_admin" {
  display_name = "dcd_group_aks_admin_global_v2"
}

resource "azuread_group_member" "platform_operations_sc_aks_global_admin" {
  count = var.env == "prod" ? 1 : 0

  group_object_id  = data.azuread_group.aks_global_admin.object_id
  member_object_id = var.platform_operations_sc
}