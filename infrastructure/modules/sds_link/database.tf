
resource "azurerm_data_factory_linked_service_azure_sql_database" "video" {
  provider                 = azurerm.vh
  name                     = "vhvideo_link"
  data_factory_id          = var.adf_id
  resource_group_name      = "vh-reporting-infra-${var.env}"
  use_managed_identity     = true
  integration_runtime_name = var.adf_integration_runtime_name
  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.infra_core.name
    secret_name         = "connectionstrings--vhvideo"
  }
}