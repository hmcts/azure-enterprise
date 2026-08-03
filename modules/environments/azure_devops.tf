resource "azuredevops_serviceendpoint_azurerm" "endpoint" {
  count                                  = var.add_service_connection_to_ado == true ? 1 : 0
  project_id                             = var.project_id
  service_endpoint_name                  = "OPS-APPROVAL-GATE-${upper(var.env)}-ENVS"
  description                            = "Managed by Terraform - azure-enterprise (https://github.com/hmcts/azure-enterprise)"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azuread_service_principal.sp.client_id
  }
  azurerm_spn_tenantid = data.azurerm_client_config.current.tenant_id

  # current data resource only supports searching for subscriptions by prefix and not for an exact match
  # this creates issues when multiple subscriptions contain the same string e.g. `DTS-SHAREDSERIVCESPTL` and `DTS-SHAREDSERVICESPTL-SBOX`
  # see https://github.com/hashicorp/terraform-provider-azurerm/issues/18462
  # for expression below will extract the subscriptions and match the correct subscription id and display_name based on the variable display_name_prefix
  azurerm_subscription_id   = [for elem in data.azurerm_subscriptions.service_endpoint_subscription[0].subscriptions[*] : elem.subscription_id if elem.display_name == var.display_name_prefix][0]
  azurerm_subscription_name = [for elem in data.azurerm_subscriptions.service_endpoint_subscription[0].subscriptions[*] : elem.display_name if elem.display_name == var.display_name_prefix][0]
}

resource "azuread_application_federated_identity_credential" "endpoint" {
  count                 = var.add_service_connection_to_ado == true ? 1 : 0
  application_id        = azuread_application.app.id
  display_name          = replace(replace("OPS-APPROVAL-GATE-${upper(var.env)}-ENVS", "/", "__"), ":", "_")
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = azuredevops_serviceendpoint_azurerm.endpoint[0].workload_identity_federation_issuer
  subject               = azuredevops_serviceendpoint_azurerm.endpoint[0].workload_identity_federation_subject
}
