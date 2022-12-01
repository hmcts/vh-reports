terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=2.99"
      configuration_aliases = [azurerm.sds_subcription]
    }
  }
}
