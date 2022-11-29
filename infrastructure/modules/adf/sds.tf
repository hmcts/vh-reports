data "azurerm_client_config" "sds" {
  provider = azurerm.sds_subcription
}
data "azurerm_user_assigned_identity" "sds_adf_mi" {
  provider            = azurerm.sds_subcription
  name                = "vh-adf-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}


module "sds_connection" {
  source = "../sds_link"
  providers = {
    azurerm = azurerm.sds_subcription
  }

  adf_id                       = azurerm_data_factory.adf.id
  adf_integration_runtime_name = azurerm_data_factory_integration_runtime_azure.adfintegration.name

  env = var.env
}
