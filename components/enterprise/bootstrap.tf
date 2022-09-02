module "tags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=DTSPO-9743/azure-enterprise"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

module "bootstrap_cft_non_production_subscriptions" {
  for_each = { for subscription in var.subscriptions :
    subscription.name => subscription
  }

  source = "../../modules/bootstrap"

  name                = join("", ["c", substr(replace(module.cft_non_production_subscriptions.subscription_id[0], "-", ""), 0, 8), substr(replace(module.cft_non_production_subscriptions.subscription_id[0], "-", ""), 24, 12)])
  resource_group_name = join("-", ["azure-control", var.env, "rg"])
  tags                = module.tags.common_tags
  subscription_id     = module.cft_non_production_subscriptions.subscription_id[0]
  subscription_name   = module.cft_non_production_subscriptions.subscription_name[0]
  scope               = "/subscriptions/${module.cft_non_production_subscriptions.subscription_id[0]}"
  env                 = var.env
}
