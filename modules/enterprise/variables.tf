variable "root_id" {}
variable "root_name" {}
variable "root_parent_id" {}

variable "create_custom_roles" {
  default = false
}

variable "management_groups" {
  type = map(
    object({ display_name = string, parent_management_group_id = string, subscription_ids = list(string), contributor_role = optional(string) })
  )

  validation {
    condition     = can([for k in keys(var.management_groups) : regex("^[a-zA-Z0-9-]{2,36}$", k)]) || length(keys(var.management_groups)) == 0
    error_message = "The management_groups keys must be between 2 to 36 characters long and can only contain lowercase letters, numbers and hyphens."
  }
}

variable "enable_platform_ops_non_prod_membership" {
  description = "If true, add Platform Operations SC group as member of all non-prod DTS Contributors groups."
  type        = bool
  default     = true
}
