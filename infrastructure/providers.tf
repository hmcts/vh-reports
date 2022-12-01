terraform {

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias = "sds_subcription"

  tenant_id       = var.sds_credentails.sds_tenant_id
  subscription_id = var.sds_credentails.sds_subcription_id

  client_id     = var.sds_credentails.sds_client_id
  client_secret = var.sds_credentails.sds_client_secret

}