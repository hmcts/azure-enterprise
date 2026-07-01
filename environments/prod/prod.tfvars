cft_sandbox_subscriptions = {
  DCD-CFT-Sandbox = {
    environment = "sbox"
    deploy_acme = true
  }
  DCD-CFTAPPS-SBOX = {
    deploy_acme = true
  }
  DCD-ROBOTICS-SBOX = {}
}
cft_non_production_subscriptions = {
  DCD-CFTAPPS-DEMO = {
    deploy_acme = true
  }
  DCD-CFTAPPS-DEV = {
    deploy_acme = true
    additional_readers = [
      "14b22215-46e6-48a9-8681-e8cefe66236a", # jenkins-aat-mi
      "c860eaa0-74be-4731-8370-db94c5fdad81", # jenkins-prod-mi
    ]
  }
  DCD-CFTAPPS-ITHC = {
    deploy_acme = true
  }
  DCD-CFTAPPS-TEST = {
    deploy_acme = true
  }
  DCD-CFTAPPSDATA-DEMO = {
    deploy_acme = true
  }
  DCD-CNP-DEV = {
    deploy_acme = true
    additional_readers = [
      "c860eaa0-74be-4731-8370-db94c5fdad81", # jenkins-prod-mi
    ]
  }
  DCD-CNP-QA = {
    deploy_acme = true
    environment = "test"
  }
  DCD-ROBOTICS-DEV = {
    environment = "dev"
  }
}
cft_production_subscriptions = {
  DCD-CFTAPPS-PROD = {
    deploy_acme = true
  }
  DCD-CFTAPPS-STG = {
    deploy_acme = true
  }
  DCD-CNP-Prod = {
    deploy_acme = true
  }
  DTS-CFTPTL-INTSVC = {
    deploy_acme              = true
    environment              = "ptl"
    purge_protection_enabled = true
    additional_readers = [
      "933c1e6e-7915-4ac9-aee2-f0a67ba626ae", # DTS Bootstrap (sub:dcd-cftapps-dev)
      "c822a60c-d948-46f2-a4ce-b1c7ecd33f2f", # DTS Bootstrap (sub:dcd-cftapps-stg)
      "98053eb3-8523-4c5a-96d3-c15532f87c19", # DTS Bootstrap (sub:dcd-cftapps-prod)
      "14b22215-46e6-48a9-8681-e8cefe66236a", # jenkins-aat-mi
      "c860eaa0-74be-4731-8370-db94c5fdad81", # jenkins-prod-mi
    ]
  }
  DTS-CFTSBOX-INTSVC = {
    deploy_acme = true
    environment = "ptlsbox"
    additional_readers = [
      "e97a1e1d-0ae8-48b4-ae3a-49f8cdb44bfb", # jenkins-sbox-mi
    ]
  }
}

sds_sandbox_subscriptions = {
  DTS-SHAREDSERVICES-SBOX = {
    deploy_acme = true
  }
}
sds_non_production_subscriptions = {
  DTS-SHAREDSERVICES-DEMO = {
    deploy_acme = true
  }
  DTS-SHAREDSERVICES-DEV = {
    deploy_acme = true
    additional_readers = [
      "df14f052-7865-49c6-b6f9-13e123dd8b66", # jenkins-stg-mi
      "b7167d08-1908-410f-9f0d-ebfb93d248c9", # jenkins-prod-mi
    ]
    additional_api_permissions = {
      "73c2949e-da2d-457a-9607-fcc665198967" = {
        "817468d0-81dd-4cb5-94ac-07ca133fbbf6" = "Scope"
      }
    }
  }
  DTS-SHAREDSERVICES-ITHC = {
    deploy_acme = true
  }
  DTS-SHAREDSERVICES-TEST = {
    deploy_acme = true
  }
  DTS-ARCHIVING-TEST = {
    environment = "test"
    product     = "arm"
  }
}
sds_production_subscriptions = {
  DTS-SHAREDSERVICES-STG = {
    deploy_acme = true
  }
  DTS-SHAREDSERVICES-PROD = {
    deploy_acme = true
    additional_api_permissions = {
      "73c2949e-da2d-457a-9607-fcc665198967" = {
        "817468d0-81dd-4cb5-94ac-07ca133fbbf6" = "Scope"
      }
    }
  }
  DCD-AWS-Migration = {
    environment = "prod"
  }
  DCD-CFT-VH-Pilot = {
    deploy_acme = true
    environment = "prod"
  }
  DTS-SHAREDSERVICESPTL = {
    deploy_acme = true
    environment = "ptl"
    additional_readers = [
      "df14f052-7865-49c6-b6f9-13e123dd8b66", # jenkins-stg-mi
      "b7167d08-1908-410f-9f0d-ebfb93d248c9", # jenkins-prod-mi
    ]
  }
  DTS-SHAREDSERVICESPTL-SBOX = {
    deploy_acme = true
    environment = "ptlsbox"
    additional_readers = [
      "c445bc65-3550-421e-af0e-5ab8e8a06a79", # jenkins-sbox-mi
    ]
  }
  DTS-ARCHIVING-PROD = {
    environment = "prod"
    product     = "arm"
  }
}

crime_subscriptions = {
  CRIME-ADO-POC = {
    environment = "prod"
    product     = "crime-platform"
  }
  "MoJ Common Platform Non-Live Management" = {
    environment = "stg"
    product     = "crime-platform"
  }
  "MOJ DCD Atlassian NLE" = {
    environment = "stg"
    product     = "crime-platform"
  }
  "MoJ Common Platform Production" = {
    environment = "prod"
    product     = "crime-platform"
  }
  "MOJ DCD Atlassian LVE" = {
    environment = "prod"
    product     = "crime-platform"
  }
  "MoJ Common Platform Operational Services" = {
    environment = "prod"
    product     = "crime-platform"
  }
}

heritage_sandbox_subscriptions = {
  DTS-DATAINGEST-SBOX = {
    environment = "sbox"
  }
}
heritage_non_production_subscriptions = {
  DTS-DATAINGEST-STG = {
    environment = "stg"
  }
  DTS-HERITAGE-EXTSVC-STG = {
    environment = "stg"
  }
  DTS-HERITAGE-INTSVC-STG = {
    environment = "stg"
  }
  DTS-HERITAGE-INTSVC-DEV = {
    environment = "dev"
  }
  DTS-HERITAGE-INTSVC-SIT = {
    environment = "sit"
  }
}
heritage_production_subscriptions = {
  DTS-DATAINGEST-PROD = {
    environment = "prod"
  }
  DTS-HERITAGE-EXTSVC-PROD = {
    environment = "prod"
  }
  DTS-HERITAGE-INTSVC-PROD = {
    environment = "prod"
  }
}

security_subscriptions = {
  HMCTS-SOC-SBOX = {
    deploy_acme = true
  }
  HMCTS-SOC-PROD = {
    deploy_acme = true
  }
}

platform_sandbox_subscriptions = {
  DTS-MANAGEMENT-SBOX-INTSVC = {
    environment = "sbox"
    product     = "mgmt"
  }
  HMCTS-HUB-SBOX-INTSVC = {
    environment = "sbox"
    deploy_acme = true
    product     = "hub"
  }
  DTS-DACS-SBOX = {
    product = "enterprise"
  }
  CP-COPILOT-BETA = {
    environment = "sbox"
    product     = "enterprise"
  }
}
platform_non_production_subscriptions = {
  DTS-MANAGEMENT-NONPROD-INTSVC = {
    environment = "stg"
    product     = "mgmt"
  }
  HMCTS-HUB-NONPROD-INTSVC = {
    environment = "stg"
    deploy_acme = true
    product     = "hub"
  }
  DCD-RDO-Development = {
    environment = "dev"
    product     = "cft-platform"
  }
}
platform_production_subscriptions = {
  HMCTS-CONTROL = {
    environment      = "prod"
    product          = "enterprise"
    replication_type = "RAGRS"
  }
  DTS-MANAGEMENT-PROD-INTSVC = {
    environment = "prod"
    product     = "mgmt"
    additional_api_permissions = {
      # Granting audit permissions to the daily check service principal
      # these need to be granted in the portal, i think that's consistent with what we already have
      "00000003-0000-0000-c000-000000000000" = {        # ms graph
        "c74fd47d-ed3c-45c3-9a9e-b8676de685d2" = "Role" # EntitlementManagement.Read.All
        "01e37dc9-c035-40bd-b438-b2879c4870a6" = "Role" # PrivilegedAccess.Read.AzureADGroup
      }
    }
  }
  HMCTS-HUB-PROD-INTSVC = {
    environment = "prod"
    deploy_acme = true
    product     = "hub"
  }
  Reform-CFT-Mgmt = {
    environment = "mgmt"
    product     = "mgmt"
  }
  DCD-RDO-Production = {
    environment = "prod"
    product     = "mgmt"
  }
  DTS-INNOVATION-PROD = {
    environment = "prod"
    product     = "innovation"
  }
}

#SPS
sps_production_subscriptions = {
  DTS-SPS-STG = {
    deploy_acme = true
    product     = "sps-platform"
  }
  DTS-SPS-PROD = {
    deploy_acme = true
    product     = "sps-platform"
  }
}

sps_non_production_subscriptions = {
  DTS-SPS-DEMO = {
    deploy_acme = true
    product     = "sps-platform"
  }
  DTS-SPS-ITHC = {
    deploy_acme = true
    product     = "sps-platform"
  }
  DTS-SPS-PERFTEST = {
    environment = "test"
    deploy_acme = true
    product     = "sps-platform"
  }
  DTS-SPS-PREVIEW = {
    environment = "dev"
    deploy_acme = true
    product     = "sps-platform"
  }
}

sps_sandbox_subscriptions = {
  DTS-SPS-SBOX = {
    deploy_acme = true
    product     = "sps-platform"
  }
}
#SPS End

vh_subscriptions = {}

enrollment_account_name = "233705"

add_service_connection_to_ado = true

contributor_role = "Azure Contributor Role minus deletes"

# Group Object IDs
#"DTS Platform Operations"
platform_operations = "e7ea2042-4ced-45dd-8ae3-e051c6551789"
# "DTS Azure PIM Approvers (CNP)"
pim_approvers = "cfdbb1cc-e789-4d2c-b390-1d9ed77603d3"
