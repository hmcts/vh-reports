terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99"
    }
  }
}

provider "azurerm" {
  features {}
  alias           = "sds_subcription"
  subscription_id = var.sds_subcription_id
}
