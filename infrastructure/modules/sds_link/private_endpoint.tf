

resource "azurerm_data_factory_managed_private_endpoint" "sds_infra_core" {
  provider           = azurerm.vh
  name               = "vhadfsdsendpoint"
  data_factory_id    = var.adf_id
  target_resource_id = data.azurerm_sql_server.infra_core.id
  subresource_name   = "sqlServer"

}