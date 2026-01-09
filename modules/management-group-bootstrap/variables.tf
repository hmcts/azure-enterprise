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