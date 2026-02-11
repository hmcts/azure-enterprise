# Lookup Platform Operations SC group

# Filter out production management groups
locals {
  mg_non_prod = {
    for k, mg in var.groups :
    k => {
      id           = k
      display_name = mg.display_name
    }
    # to exclude production management groups including those top-level ones HMCTS, CFT, SDS, Platform, Security,
    # Crime, and Heritage
    # DTSPO-29259-contributor only on sandbox going forward
    if can(regex("(?i)(sandbox)", mg.display_name))
  }

  contributors_non_prod = {
    for k, g in azuread_group.contributors :
    k => g
    if contains(keys(local.mg_non_prod), k)
  }
}
