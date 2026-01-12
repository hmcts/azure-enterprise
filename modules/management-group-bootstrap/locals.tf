locals {
  custom_role_assignments_readers = [
    "Application Gateway Backend Health Reader"
  ]

  group_assignment_product_readers = setproduct(keys(var.groups), local.custom_role_assignments_readers)

  is_sandbox_environment = var.env == "sandbox"
  is_prod_environment    = var.env == "prod"

  group_ids = {
    platform_ops = {
      sandbox = var.platform_operations
      prod    = var.platform_operations
    }
    pim_approvers = {
      sandbox = var.pim_approvers
      prod    = var.pim_approvers
    }
  }

  platform_ops_group_id  = local.group_ids.platform_ops[var.env]
  pim_approvers_group_id = local.group_ids.pim_approvers[var.env]
}