locals {
  app_name = join(" ", ["DTS Operations", join("", ["(", join(":", ["env", var.env]), ")"])])
  groups = {
    "DTS Operations" = {
      name        = join(" ", ["DTS Operations", join("", ["(", join(":", ["env", var.env]), ")"])]),
      description = "${var.env} Operations elevated access"
      members     = [azuread_service_principal.sp.object_id]
    }
    "DNS Zone Contributor" = {
      name        = join(" ", ["DTS Public DNS Contributor", join("", ["(", join(":", ["env", var.env]), ")"])]),
      description = "Grants dns zone contributor permissions to the ${var.env} environment"
      members     = [azuread_group.groups["DTS Operations"].object_id, azuread_service_principal.sp.object_id]
    }
  }
}