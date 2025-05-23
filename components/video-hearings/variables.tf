variable "root_id" {
  type    = string
  default = "hmcts"
}

variable "root_name" {
  type    = string
  default = "HMCTS"
}

variable "location" {
  default = "UK South"
}

variable "sp_sku_name" {
  default     = "Y1"
  description = "SKU name for App Service Plan."
}

# unused
variable "env" {}
variable "builtFrom" {}
variable "product" {}

variable "cft_subscriptions" {
  default = {}
}
variable "cft_sandbox_subscriptions" {
  default = {}
}
variable "cft_non_production_subscriptions" {
  default = {}
}
variable "cft_production_subscriptions" {
  default = {}
}

variable "sds_subscriptions" {
  default = {}
}
variable "sds_sandbox_subscriptions" {
  default = {}
}
variable "sds_non_production_subscriptions" {
  default = {}
}
variable "sds_production_subscriptions" {
  default = {}
}
variable "crime_subscriptions" {
  default = {}
}
variable "heritage_subscriptions" {
  default = {}
}
variable "heritage_sandbox_subscriptions" {
  default = {}
}
variable "heritage_non_production_subscriptions" {
  default = {}
}
variable "heritage_production_subscriptions" {
  default = {}
}
variable "security_subscriptions" {
  default = {}
}
variable "platform_subscriptions" {
  default = {}
}
variable "platform_sandbox_subscriptions" {
  default = {}
}
variable "platform_non_production_subscriptions" {
  default = {}
}
variable "platform_production_subscriptions" {
  default = {}
}

variable "billing_account_name" {
  default = "59232335"
}

variable "enrollment_account_name" {}

variable "vh_subscriptions" {
  default = {}
}

variable "deploy_acme" {
  default = false
}

variable "expiresAfter" {
  description = "Date when Sandbox resources can be deleted. Format: YYYY-MM-DD"
  default     = "3000-01-01"
}

# Defined here as we have an input in the tfvar file but this variable is not used within this component
variable "create_custom_roles" {
  default     = true
  description = "Should this component create any custom roles defined in the enterprise module"
}
