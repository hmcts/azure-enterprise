locals {
  custom_role_assignments_readers = [
    "Application Gateway Backend Health Reader"
  ]

  group_assignment_product_readers = setproduct(keys(var.groups), local.custom_role_assignments_readers)

  is_sandbox_environment = var.env == "sandbox"
  is_prod_environment    = var.env == "prod"

  
}