locals {
  custom_role_assignments_readers = [
    "Application Gateway Backend Health Reader"
  ]

  group_assignment_product_readers = setproduct(keys(var.groups), local.custom_role_assignments_readers)

  # Environment detection based on management group names
  is_sandbox_environment = anytrue([
    for k, mg in var.groups : 
    can(regex("(?i)(sandbox|sbox)", mg.display_name))
  ])

  # Centralized environment-specific group ID mappings
  environment_group_ids = {
    platform_ops = {
      display_name = "DTS Platform Operations"
      sandbox_id   = "9b200a9c-8c0b-497a-9246-2c9b4dcc0d02"
      prod_id      = "e7ea2042-4ced-45dd-8ae3-e051c6551789"
    }
    pim_approvers = {
      display_name = "DTS Azure PIM Approvers (CNP)"
      sandbox_id   = "3e1fcd71-06ff-4531-a2fa-db6468830fda"
      prod_id      = "cfdbb1cc-e789-4d2c-b390-1d9ed77603d3"
    }
  }

  # Selected group IDs based on detected environment
  platform_ops_group_id  = local.is_sandbox_environment ? local.environment_group_ids.platform_ops.sandbox_id : local.environment_group_ids.platform_ops.prod_id
    
  pim_approvers_group_id = local.is_sandbox_environment ? local.environment_group_ids.pim_approvers.sandbox_id : local.environment_group_ids.pim_approvers.prod_id

}