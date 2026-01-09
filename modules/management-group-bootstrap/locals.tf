locals {
  custom_role_assignments_readers = [
    "Application Gateway Backend Health Reader"
  ]

  group_assignment_product_readers = setproduct(keys(var.groups), local.custom_role_assignments_readers)

  has_prod_groups = anytrue([
    for k, mg in var.groups :
    strcontains(lower(mg.display_name), "prod") ||
    strcontains(lower(mg.display_name), "production")
  ])

  detected_environment = local.has_prod_groups ? "prod" : "sandbox"

  is_prod_environment    = local.detected_environment == "prod"
  is_sandbox_environment = local.detected_environment == "sandbox"

  group_ids = {
    platform_ops = {
      sandbox = "9b200a9c-8c0b-497a-9246-2c9b4dcc0d02"
      prod    = "e7ea2042-4ced-45dd-8ae3-e051c6551789"
    }
    pim_approvers = {
      sandbox = "3e1fcd71-06ff-4531-a2fa-db6468830fda"
      prod    = "cfdbb1cc-e789-4d2c-b390-1d9ed77603d3"
    }
  }

  platform_ops_group_id  = local.group_ids.platform_ops[local.detected_environment]
  pim_approvers_group_id = local.group_ids.pim_approvers[local.detected_environment]
}