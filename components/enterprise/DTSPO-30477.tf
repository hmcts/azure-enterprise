resource "azurerm_role_assignment" "dts_sharedservicesptl_sbox_reader" {
  count                = var.env == "prod" ? 1 : 0
  scope                = "/subscriptions/64b1c6d6-1481-44ad-b620-d8fe26a2c768"
  role_definition_name = "Reader"
  principal_id         = "5356a0e7-324e-4efa-970b-4b4aec3f0ba3" #jenkins-ptlsbox-build-only-mi
}

resource "azurerm_role_assignment" "dts_sharedservices_sbox_reader" {
  count                = var.env == "prod" ? 1 : 0
  scope                = "/subscriptions/a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"
  role_definition_name = "Reader"
  principal_id         = "5356a0e7-324e-4efa-970b-4b4aec3f0ba3" #jenkins-ptlsbox-build-only-mi
}
