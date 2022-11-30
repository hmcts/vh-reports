
module "sds_connection" {
  source = "../sds_link"
  providers = {
    azurerm    = azurerm.sds_subcription
    azurerm.vh = azurerm
  }

  adf_id                       = azurerm_data_factory.adf.id
  adf_integration_runtime_name = azurerm_data_factory_integration_runtime_azure.adfintegration.name

  env = var.env

  adf_mi_principal_id = azurerm_user_assigned_identity.adf-mi.principal_id
}
