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

# Enterprise application/service principal behind "DTS Operations (env:X)", distinct from the group of the same name above
# Scoped to only the subscriptions that opt in, so environments without this app (e.g. mgmt, sit) aren't affected
data "azuread_service_principal" "dts_operations" {
  count        = var.dts_operations_into_aks_admin ? 1 : 0
  display_name = "DTS Operations (env:${var.environment})"
}
