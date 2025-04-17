moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_subscription.this
  to   = module.subscription.azurerm_subscription.this_dts_vh_prod
}

removed {
  from = module.subscription.azurerm_subscription.this_dts_vh_prod

  lifecycle {
    destroy = false
  }
}