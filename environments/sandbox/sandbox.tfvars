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

platform_operations = "9b200a9c-8c0b-497a-9246-2c9b4dcc0d02"
pim_approvers       = "3e1fcd71-06ff-4531-a2fa-db6468830fda"
