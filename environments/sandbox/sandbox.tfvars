cft_sandbox_subscriptions = {
  DTS-RBAC-SBOX = {}
}

cft_production_subscriptions = {
  DTS-Terraform-Prod-Test1 = {
    environment = "prod"
  }
}

cft_non_production_subscriptions = {
  DTS-Terraform-Dev-Test3 = {
    environment = "dev"
    deploy_acme = true
  }
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
