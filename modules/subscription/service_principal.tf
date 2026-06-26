resource "time_rotating" "rotation_period" {
  rotation_days = 90
}

resource "random_uuid" "app_uuid" {}

resource "azuread_application" "app" {
  display_name = local.app_name
  api {
    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access ${local.app_name} on behalf of the signed-in user."
      admin_consent_display_name = "Access ${local.app_name}"
      id                         = random_uuid.app_uuid.result
      enabled                    = true
      type                       = "User"
      user_consent_description   = "Allow the application to access ${local.app_name} on your behalf."
      user_consent_display_name  = "Access ${local.app_name}"
      value                      = "user_impersonation"
    }
  }
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph
    resource_access {
      id   = "06da0dbc-49e2-44d2-8312-53f166ab848a" # Directory.Read.All Delegated
      type = "Scope"
    }

    resource_access {
      id   = "5b567255-7703-4780-807c-7be8301ae99b" # Group.Read.All Application
      type = "Role"
    }

    resource_access {
      id   = "9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30" # Application.Read.All Application
      type = "Role"
    }
  }
  dynamic "required_resource_access" {
    for_each = var.additional_api_permissions
    content {
      resource_app_id = required_resource_access.key
      dynamic "resource_access" {
        for_each = required_resource_access.value
        content {
          id   = resource_access.key
          type = resource_access.value
        }
      }
    }
  }
  web {
    homepage_url = "https://dev.azure.com/hmcts/PlatformOperations"

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  lifecycle { # used to append an extra assignment in a separate block
    ignore_changes = [
      required_resource_access,
    ]
  }

  notes = var.notes
}

resource "azuread_application_api_access" "privilege_management_graph_perm" {
  count = local.app_name == "DTS Bootstrap (sub:dts-management-prod-intsvc)" ? 1 : 0

  application_id = azuread_application.app.id
  api_client_id  = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]
  role_ids = [
    # these need to be granted in the portal, i think that's consistent with what we already have
    data.azuread_service_principal.graph_api_principal.app_role_ids["EntitlementManagement.Read.All"],
    data.azuread_service_principal.graph_api_principal.app_role_ids["PrivilegedAccess.Read.AzureADGroup"],
    data.azuread_service_principal.graph_api_principal.app_role_ids["GroupMember.Read.All"],
  ]
}


resource "azuread_application_password" "token" {
  application_id = azuread_application.app.id
  rotate_when_changed = {
    rotation = time_rotating.rotation_period.id
  }
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
}
