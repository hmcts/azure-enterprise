terraform {
  required_version = ">= 1.11.1, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.47.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {}

provider "azuread" {}

data "azurerm_client_config" "core" {}
