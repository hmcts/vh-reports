data "azurerm_key_vault" "core-kv" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

data "azurerm_storage_account" "core-sa" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

data "azurerm_client_config" "current" {}

resource "azurerm_data_factory" "adf" {
  name                = "vh-datafactory-${var.env}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.adf-mi.id]
  }
}

resource "azurerm_user_assigned_identity" "adf-mi" {
  resource_group_name = var.rg_name
  location            = var.rg_location

  name = "vh-adf-mi-${var.env}"
}

resource "azurerm_key_vault_access_policy" "kvaccess" {
  key_vault_id = data.azurerm_key_vault.core-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.adf-mi.principal_id

  key_permissions = [
    "Get", "List",
  ]

  secret_permissions = [
    "Get", "List",
  ]

}

resource "azurerm_data_factory_linked_service_key_vault" "adfkeyvault" {
  name                = "vhreporting-kv-link"
  data_factory_id     = azurerm_data_factory.adf.id
  key_vault_id        = data.azurerm_key_vault.core-kv.id
  resource_group_name = "vh-reporting-infra-${var.env}"
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "adfblob" {
  name                = "vhreporting_blob"
  data_factory_id     = azurerm_data_factory.adf.id
  connection_string   = data.azurerm_storage_account.core-sa.primary_connection_string
  resource_group_name = "vh-reporting-infra-${var.env}"
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "adfvideodb" {
  name                = "vhvideo_link"
  data_factory_id     = azurerm_data_factory.adf.id
  resource_group_name = "vh-reporting-infra-${var.env}"
  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
    secret_name         = "VhVideoDatabaseConnectionString"
  }
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "adfreportingdb" {
  name                = "vhreporting_link"
  data_factory_id     = azurerm_data_factory.adf.id
  resource_group_name = "vh-reporting-infra-${var.env}"
  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
    secret_name         = "VhReportingDatabaseConnectionString"
  }
}