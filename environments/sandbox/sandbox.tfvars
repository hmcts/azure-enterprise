cft_sandbox_subscriptions = {
  # DTS-RBAC-SANDBOX = {
  #   environment = "sbox"
  # }
}

cft_production_subscriptions = {
  # DTS-RBAC-PROD = {
  #   environment = "prod"
  # }
  # DTS-RBAC-PRODUCTION = {
  #   environment = "prod"
  # }
  # DCD-RBAC-CONTROL = {
  #   environment      = "prod"
  #   replication_type = "RAGRS"
  # }
}

cft_non_production_subscriptions = {
  DTS-Terraform-Dev-Test4 = {
    environment                    = "dev"
    deploy_acme                    = true
    acme_storage_account_repl_type = "LRS"
  }
  DTS-RBAC-NONPRODUCTION = {
    environment = "dev"
  }
}

enrollment_account_name = "322108"

# Create custom_roles for sandbox/enterprise component
create_custom_roles = true

# Platform Operations (non-SC)
platform_operations = "e7ea2042-4ced-45dd-8ae3-e051c6551789"
# Platform Operations SC
platform_operations_sc = "4d0554dd-fe60-424a-be9c-36636826d927"
pim_approvers          = "3e1fcd71-06ff-4531-a2fa-db6468830fda"
