locals {
  arm_file_path = "../logicApp/appInsightsToStorage.json"
}

data "azurerm_client_config" "current" {}
data "azurerm_mssql_server" "core-sql-server" {
  name                = "vh-core-infra-${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

data "template_file" "workflow" {
  template = file(local.arm_file_path)
}

data "azurerm_storage_account" "core-sa" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

resource "azurerm_resource_group" "vh-reporting-rg" {
  name     = "vh-reporting-infra-${var.env}"
  location = var.location
}
module "data_factory_config" {
  source = "./modules/adf"

  env         = var.env
  rg_name     = azurerm_resource_group.vh-reporting-rg.name
  rg_location = azurerm_resource_group.vh-reporting-rg.location

}

#TODO remove the below and use azurerm_api_connection to configure the connections and the json deploy task to configure the workflow
resource "azurerm_template_deployment" "workflow" {
  resource_group_name = azurerm_resource_group.vh-reporting-rg.name

  template_body = data.template_file.workflow.template

  # The filemd5 forces this to run when the file is changed
  # this ensures the keys are up-to-date
  name            = "workflow-${filemd5(local.arm_file_path)}"
  deployment_mode = "Incremental"
  parameters = {
    environment  = "${var.env}"
    location     = "${var.location}"
    subscription = "${data.azurerm_client_config.current.subscription_id}"
  }

}

resource "local_file" "logicapp" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

resource "azurerm_mssql_database" "vhreporting" {
  name         = "vhreporting"
  server_id    = data.azurerm_mssql_server.core-sql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
}

resource "azurerm_storage_container" "vhreporting" {
  name                  = "vhreporting"
  storage_account_name  = data.azurerm_storage_account.core-sa.name
  container_access_type = "private"
}
#resource "azurerm_data_factory" "adf" {
#  name                = "vh-datafactory-${var.env}"
#  location            = azurerm_resource_group.vh-reporting-rg.location
#  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
#  identity {
#    type         = "UserAssigned"
#    identity_ids = [azurerm_user_assigned_identity.adf-mi.id]
#  }
#}

#TODO use the below to deploy the logic app
#resource "azurerm_logic_app_workflow" "logicapp" {
#  name                = "vh-reporting-${var.env}"
#  location            = azurerm_resource_group.vh-reporting-rg.location
#  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
#}



#resource "azurerm_user_assigned_identity" "adf-mi" {
#  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
#  location            = azurerm_resource_group.vh-reporting-rg.location
#
#  name = "vh-adf-mi-${var.env}"
#}
#
#resource "azurerm_key_vault_access_policy" "kvaccess" {
#  key_vault_id = data.azurerm_key_vault.core-kv.id
#  tenant_id    = data.azurerm_client_config.current.tenant_id
#  object_id    = azurerm_user_assigned_identity.adf-mi.principal_id
#
#  key_permissions = [
#    "Get", "List",
#  ]
#
#  secret_permissions = [
#    "Get", "List",
#  ]
#
#}

#resource "azurerm_data_factory_linked_service_key_vault" "adfkeyvault" {
#  name                = "vhreporting-kv-link"
#  data_factory_id     = azurerm_data_factory.adf.id
#  key_vault_id        = data.azurerm_key_vault.core-kv.id
#  resource_group_name = "vh-reporting-infra-${var.env}"
#}
#
#resource "azurerm_data_factory_linked_service_azure_blob_storage" "adfblob" {
#  name                = "vhreporting_blob"
#  data_factory_id     = azurerm_data_factory.adf.id
#  connection_string   = data.azurerm_storage_account.core-sa.primary_connection_string
#  resource_group_name = "vh-reporting-infra-${var.env}"
#}
#
#resource "azurerm_data_factory_linked_service_azure_sql_database" "adfvideodb" {
#  name                = "vhvideo_link"
#  data_factory_id     = azurerm_data_factory.adf.id
#  resource_group_name = "vh-reporting-infra-${var.env}"
#  key_vault_connection_string {
#    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
#    secret_name         = "VhVideoDatabaseConnectionString"
#  }
#}
#
#resource "azurerm_data_factory_linked_service_azure_sql_database" "adfreportingdb" {
#  name                = "vhreporting_link"
#  data_factory_id     = azurerm_data_factory.adf.id
#  resource_group_name = "vh-reporting-infra-${var.env}"
#  key_vault_connection_string {
#    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
#    secret_name         = "VhReportingDatabaseConnectionString"
#  }
#}



