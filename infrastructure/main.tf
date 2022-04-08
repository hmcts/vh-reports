locals {
  arm_file_path = "../logicApp/test.json"
}

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

data "template_file" "workflow" {
  template = file(local.arm_file_path)
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

#resource "azurerm_template_deployment" "workflow" {
#  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
#
#  template_body = data.template_file.workflow.template
#
#  # The filemd5 forces this to run when the file is changed
#  # this ensures the keys are up-to-date
#  name            = "workflow-${filemd5(local.arm_file_path)}"
#  deployment_mode = "Incremental"
#
#}

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

resource "azurerm_storage_container" "vhreporting" {
  name                  = "vhreporting"
  storage_account_name  = data.azurerm_storage_account.core-sa.name
  container_access_type = "private"
}


