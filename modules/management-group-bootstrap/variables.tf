variable "groups" {
  type = any
}

variable "custom_roles" {}

variable "env" {
  description = "Environment name (sandbox or prod)"
  type        = string

  validation {
    condition     = contains(["sandbox", "prod"], var.env)
    error_message = "Environment must be 'sandbox' or 'prod'."
  }
}

variable "platform_operations" {
}

variable "root_parent_id" {
  description = "Root management group ID"
  type        = string
}
