module "subscription" {
  for_each = local.subscriptions

  source      = "../../modules/subscription"
  name        = each.key
  value       = each.value
  common_tags = module.tags[each.key].common_tags
  environment = try(each.value.environment, lower(replace([each.key][0], local.regex_last_section_hyphen, "$1")))

  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
  deploy_acme             = try(each.value.deploy_acme, false)
  replication_type        = try(each.value.replication_type, "ZRS")
}

module "tags" {
  for_each     = local.subscriptions
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = try(each.value.environment, lower(replace([each.key][0], local.regex_last_section_hyphen, "$1")))
  product      = try(each.value.product, replace(regex("cft_|sds_", [each.value.group][0]), local.regex_first_section_underscore, "$1-platform"), replace(regex("security", [each.value.group][0]), local.regex_string, "soc"), replace([each.value.group][0], local.regex_first_section_underscore, "$1"))
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}
