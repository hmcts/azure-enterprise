moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_object_id
  to   = module.subscription.azurerm_key_vault_secret.sp_object_id_dts_vh_prod
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_object_id

  lifecycle {
    destroy = false
  }
}

moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_app_id
  to   = module.subscription.azurerm_key_vault_secret.sp_app_id_dts_vh_prod
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_app_id

  lifecycle {
    destroy = false
  }
}

moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_token
  to   = module.subscription.azurerm_key_vault_secret.sp_token_dts_vh_prod
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_token

  lifecycle {
    destroy = false
  }
}

moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_admin_group_id
  to   = module.subscription.azurerm_key_vault_secret.aks_admin_group_id_dts_vh_prod
}
removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_admin_group_id

  lifecycle {
    destroy = false
  }
}

moved {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_user_group_id
  to   = module.subscription.azurerm_key_vault_secret.aks_user_group_id_dts_vh_prod
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_user_group_id

  lifecycle {
    destroy = false
  }
}