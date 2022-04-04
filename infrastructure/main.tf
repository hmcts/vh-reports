data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "core-kv" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

data "azurerm_storage_account" "core-sa" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

data "azurerm_mssql_server" "core-sql-server" {
  name                = "vh-core-infra-${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

resource "azurerm_resource_group" "vh-reporting-rg" {
  name     = "vh-reporting-infra-${var.env}"
  location = var.location
}

resource "azurerm_data_factory" "adf" {
  name                = "vh-datafactory-${var.env}"
  location            = azurerm_resource_group.vh-reporting-rg.location
  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
}

resource "azurerm_logic_app_workflow" "logicapp" {
  name                = "vh-reporting-${var.env}"
  location            = azurerm_resource_group.vh-reporting-rg.location
  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
}


resource "azurerm_mssql_database" "vhreporting" {
  name         = "vhreporting"
  server_id    = data.azurerm_mssql_server.core-sql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
}

resource "azurerm_user_assigned_identity" "adf-mi" {
  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
  location            = azurerm_resource_group.vh-reporting-rg.location

  name = "adf-MI-${var.env}"
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

resource "azurerm_storage_container" "example" {
  name                  = "vhreporting"
  storage_account_name  = data.azurerm_storage_account.core-sa.name
  container_access_type = "private"
}


