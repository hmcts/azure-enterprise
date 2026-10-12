resource "azuredevops_serviceendpoint_azurerm" "endpoint" {
  project_id                             = var.project_id
  service_endpoint_name                  = azurerm_subscription.this.subscription_name
  description                            = "Managed by Terraform - azure-enterprise (https://github.com/hmcts/azure-enterprise)"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azuread_service_principal.sp.client_id
  }
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = azurerm_subscription.this.subscription_id
  azurerm_subscription_name = azurerm_subscription.this.subscription_name
}

resource "azuread_application_federated_identity_credential" "endpoint" {
  application_id = azuread_application.app.id
  display_name   = replace(replace(azurerm_subscription.this.subscription_name, "/", "__"), ":", "_")
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = azuredevops_serviceendpoint_azurerm.endpoint.workload_identity_federation_issuer
  subject        = azuredevops_serviceendpoint_azurerm.endpoint.workload_identity_federation_subject
}
