locals {
  arm_file_path   = "../logicApp/appInsightsToStorage.json"
  core_infra_name = "vh-core-infra-${var.env}"
}

data "azurerm_client_config" "current" {}
data "azurerm_mssql_server" "core-sql-server" {
  name                = local.core_infra_name
  resource_group_name = local.core_infra_name
}

data "template_file" "workflow" {
  template = file(local.arm_file_path)
}

data "azurerm_storage_account" "core-sa" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = local.core_infra_name
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
  max_size_gb  = 250
  sku_name     = "S0"
  min_capacity = 5
}


resource "azurerm_storage_container" "vhreporting" {
  name                  = "vhreporting"
  storage_account_name  = data.azurerm_storage_account.core-sa.name
  container_access_type = "private"
}



