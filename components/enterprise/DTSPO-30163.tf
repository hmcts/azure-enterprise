resource "azurerm_role_assignment" "dtspo_30163" {
  count = var.env == "prod" ? 1 : 0

  scope                = "/subscriptions/64b1c6d6-1481-44ad-b620-d8fe26a2c768" #DTS-SHAREDSERVICESPTL-SBOX
  role_definition_name = "Reader"
  principal_id         = "17ec686e-b62a-45d4-8dce-42ff580d2a32"
}
