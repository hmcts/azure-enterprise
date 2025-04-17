removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_subscription.this

  lifecycle {
    destroy = false
  }
}