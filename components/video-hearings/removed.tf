removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_object_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_app_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.sp_token

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_admin_group_id

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.subscription["DTS-VH-PROD"].azurerm_key_vault_secret.aks_user_group_id

  lifecycle {
    destroy = false
  }
}