removed {
  from = module.subscription["DTS-RBAC-SBOX"].data.azurerm_billing_enrollment_account_scope.this

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].data.azurerm_client_config.current

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_application.app

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_application_password.token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Azure Kubernetes Service Cluster Admin Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Azure Kubernetes Service Cluster User Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Contributor"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Key Vault Administrator"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Owner"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Security Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group.groups["Storage Blob Data Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.dts_operation_members

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Azure Kubernetes Service Cluster Admin Role-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Contributor-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Contributor-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Contributor-2"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Key Vault Administrator-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Key Vault Administrator-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Owner-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_group_member.members["Reader-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuread_service_principal.sp

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azuredevops_serviceendpoint_azurerm.endpoint

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault.kv

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault_secret.aks_admin_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault_secret.aks_user_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault_secret.sp_app_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault_secret.sp_object_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].azurerm_key_vault_secret.sp_token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].random_uuid.app_uuid

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-RBAC-SBOX"].time_rotating.rotation_period

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].data.azuread_group.aks_global_admin

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].data.azuread_group.dts_operations

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].data.azuread_group.ops_mgmt

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].data.azurerm_billing_enrollment_account_scope.this

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].data.azurerm_client_config.current

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_application.acme_appreg[0]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_application.app

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_application_password.token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Azure Kubernetes Service Cluster Admin Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Azure Kubernetes Service Cluster User Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Contributor"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Key Vault Administrator"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Owner"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Security Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group.groups["Storage Blob Data Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.dts_operation_members

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Azure Kubernetes Service Cluster Admin Role-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Contributor-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Contributor-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Contributor-2"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Key Vault Administrator-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Key Vault Administrator-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Owner-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_group_member.members["Reader-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuread_service_principal.sp

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azuredevops_serviceendpoint_azurerm.endpoint

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault.kv

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault_secret.aks_admin_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault_secret.aks_user_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault_secret.sp_app_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault_secret.sp_object_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].azurerm_key_vault_secret.sp_token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].random_uuid.acme_app_uuid[0]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].random_uuid.app_uuid

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Dev-Test3"].time_rotating.rotation_period

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].data.azuread_group.aks_global_admin

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].data.azuread_group.dts_operations

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].data.azuread_group.ops_mgmt

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].data.azurerm_billing_enrollment_account_scope.this

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].data.azurerm_client_config.current

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_application.acme_appreg[0]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_application.app

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_application_password.token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Azure Kubernetes Service Cluster Admin Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Azure Kubernetes Service Cluster User Role"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Contributor"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Key Vault Administrator"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Owner"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Security Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group.groups["Storage Blob Data Reader"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.dts_operation_members

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Azure Kubernetes Service Cluster Admin Role-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Contributor-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Contributor-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Contributor-2"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Key Vault Administrator-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Key Vault Administrator-1"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Owner-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_group_member.members["Reader-0"]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuread_service_principal.sp

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azuredevops_serviceendpoint_azurerm.endpoint

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault.kv

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault_secret.aks_admin_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault_secret.aks_user_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault_secret.sp_app_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault_secret.sp_object_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].azurerm_key_vault_secret.sp_token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].random_uuid.acme_app_uuid[0]

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].random_uuid.app_uuid

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-Terraform-Prod-Test1"].time_rotating.rotation_period

  lifecycle {
    destroy = false
  }
}