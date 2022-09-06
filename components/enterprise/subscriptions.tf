locals {
  cft_non_production = { for k, v in var.cft_non_production_subscriptions : k => merge(tomap({ group = "cft_non_production" }), v) }
  cft_sandbox        = { for k, v in var.cft_sandbox_subscriptions : k => merge(tomap({ group = "cft_sandbox" }), v) }

  subscriptions = merge(
    local.cft_sandbox,
    local.cft_non_production
  )
}

module "subscription" {
  for_each = local.subscriptions

  source                         = "../../modules/subscription"
  name                           = each.key
  value                          = each.value
  deploy_acme                    = try(each.value.deploy_acme, false)
  acme_storage_account_repl_type = try(each.value.acme_storage_account_repl_type, "ZRS")
  environment                    = each.value.environment

  builtFrom = var.builtFrom
  product   = var.product


  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
}