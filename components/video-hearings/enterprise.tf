module "enterprise" {
  source = "../../modules/enterprise"

  root_id             = var.root_id
  root_name           = var.root_name
  root_parent_id      = data.azurerm_client_config.core.tenant_id
  env                 = var.env
  create_custom_roles = var.create_custom_roles
  platform_operations = var.platform_operations
  pim_approvers       = var.pim_approvers

  management_groups = {
    HMCTS = {
      display_name               = "HMCTS"
      parent_management_group_id = data.azurerm_client_config.core.tenant_id
      subscription_ids           = [for subscription in values(module.subscription).*.subscription_id : subscription.subscription_id if subscription.group == "hmcts"]
    }
  }
}
