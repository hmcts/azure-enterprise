data "azurerm_client_config" "current" {}

data "azuread_group" "ops_mgmt" {
  display_name = "DTS Operations (env:mgmt)"
}

data "azuread_group" "aks_global_admin" {
  display_name = "dcd_group_aks_admin_global_v2"
}

data "azuread_group" "dts_operations" {
  display_name = "DTS Operations (env:${var.environment})"
}
# for lookups
data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "graph_api_principal" {
client_id = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]
}
