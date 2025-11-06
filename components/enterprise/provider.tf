terraform {
  required_version = ">=1.11.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
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

data "azurerm_client_config" "core" {}
