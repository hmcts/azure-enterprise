locals {
  app_name      = "DTS Bootstrap (sub:${lower(azurerm_subscription.this.subscription_name)})"
  acme_app_name = "acme-${lower(azurerm_subscription.this.subscription_name)}"
  acme_uri      = replace(lower(azurerm_subscription.this.subscription_name), "sharedservices", "sds")

  base_api_permissions = {
    # applied to all service principals
    "00000003-0000-0000-c000-000000000000" = {         # Microsoft Graph
      "06da0dbc-49e2-44d2-8312-53f166ab848a" = "Scope" # Directory.Read.All Delegated
      "5b567255-7703-4780-807c-7be8301ae99b" = "Role"  # Group.Read.All Application
      "9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30" = "Role"  # Application.Read.All Application
    }
  }

  # Deeper merge base perms with per-subscription additions so an existing API
  # (Graph) is extended rather than producing a duplicate resource_app_id
  # block (which Azure AD rejects with DuplicateValue / 400).
  api_permissions = {
    for app_id in toset(concat(keys(local.base_api_permissions), keys(var.additional_api_permissions))) :
    app_id => merge(
      lookup(local.base_api_permissions, app_id, {}),
      lookup(var.additional_api_permissions, app_id, {}),
    )
  }

  groups = {
    "Azure Kubernetes Service Cluster Admin Role" = {
      name        = "DTS AKS Administrators (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants aks cluster admin permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Azure Kubernetes Service Cluster User Role" = {
      name        = "DTS AKS Users (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants aks cluster user permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Contributor" = {
      name        = "DTS Contributors (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants contributor permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Key Vault Administrator" = {
      name        = "DTS Key Vault Administrators (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants key vault administrator permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Reader" = {
      name        = "DTS Readers (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants reader permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Security Reader" = {
      name        = "DTS Security Readers (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants security reader permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Storage Blob Data Reader" = {
      name        = "DTS Blob Readers (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants storage blob data contributor permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
    "Owner" = {
      name        = "DTS Owners (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Grants owner permissions to the ${azurerm_subscription.this.subscription_name} subscription"
    }
  }

  contributor_groups = !strcontains(lower(azurerm_subscription.this.subscription_name), "sandbox") && !strcontains(lower(azurerm_subscription.this.subscription_name), "sbox") ? {
    "Contributor Eligible" = {
      name        = "DTS Contributors Eligible (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Holds users eligible for Contributor access via access packages for ${azurerm_subscription.this.subscription_name} subscription."
    }
  } : {}

  owner_eligible_groups = !strcontains(lower(azurerm_subscription.this.subscription_name), "sandbox") && !strcontains(lower(azurerm_subscription.this.subscription_name), "sbox") ? {
    "Owner Eligible" = {
      name        = "DTS Owners Eligible (sub:${lower(azurerm_subscription.this.subscription_name)})"
      description = "Holds users eligible for Owner access via access packages for ${azurerm_subscription.this.subscription_name} subscription."
    }
  } : {}


  members = {
    "Azure Kubernetes Service Cluster Admin Role" = {
      members = [data.azuread_group.aks_global_admin.object_id]
    }
    "Contributor" = {
      members = [data.azuread_group.dts_operations.object_id, azuread_service_principal.sp.object_id, data.azurerm_client_config.current.object_id]
    }
    "Key Vault Administrator" = {
      members = [data.azuread_group.dts_operations.object_id, azuread_service_principal.sp.object_id]
    }
    "Reader" = {
      members = [data.azuread_group.ops_mgmt.object_id]
    }
    "Owner" = {
      members = [azuread_service_principal.sp.object_id]
    }
  }
  members_list = merge([for key, value in local.members : {
    for index, member in value.members : "${key}-${index}" => {
      role   = key
      member = member
    }
    }
  ]...)
  role_assignments = {
    "Key Vault Contributor" = {
      principal_id = azuread_group.groups["Contributor"].object_id
      scope        = azurerm_key_vault.kv.id
    }
    "Monitoring Contributor" = {
      principal_id = data.azuread_group.ops_mgmt.object_id
      scope        = "/subscriptions/${azurerm_subscription.this.subscription_id}"
    }
    "Network Contributor" = {
      principal_id = data.azuread_group.ops_mgmt.object_id
      scope        = "/subscriptions/${azurerm_subscription.this.subscription_id}"
    }
    "Storage Account Contributor" = {
      principal_id = azuread_group.groups["Contributor"].object_id
      scope        = azurerm_storage_account.sa.id
    }
    "Storage Blob Data Contributor" = {
      principal_id = azuread_group.groups["Contributor"].object_id
      scope        = azurerm_storage_account.sa.id
    }
    "User Access Administrator" = {
      principal_id = data.azuread_group.dts_operations.object_id
      scope        = "/subscriptions/${azurerm_subscription.this.subscription_id}"
    }
  }
}
