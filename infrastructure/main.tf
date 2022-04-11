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
#TODO use the below to deploy the logic app
#resource "azurerm_logic_app_workflow" "logicapp" {
#  name                = "vh-reporting-${var.env}"
#  location            = azurerm_resource_group.vh-reporting-rg.location
#  resource_group_name = azurerm_resource_group.vh-reporting-rg.name
#}

#TODO remove the below and use azurerm_api_connection to configure the connections and the json deploy task to configure the workflow
resource "azurerm_template_deployment" "workflow" {
  resource_group_name = azurerm_resource_group.vh-reporting-rg.name

  template_body = data.template_file.workflow.template

  # The filemd5 forces this to run when the file is changed
  # this ensures the keys are up-to-date
  name            = "workflow-${filemd5(local.arm_file_path)}"
  deployment_mode = "Incremental"

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
  name            = "vhreporting-kv-link-${var.env}"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = data.azurerm_key_vault.core-kv.id
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "adfblob" {
  name              = "vhreporting-blob-link-${var.env}"
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.core-sa.primary_connection_string
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "adfvideodb" {
  name            = "vhvideo-db"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
    secret_name         = "VhVideoDatabaseConnectionString"
  }
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "adfreportingdb" {
  name            = "vhreporting-db"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.adfkeyvault.name
    secret_name         = "VhReportingDatabaseConnectionString"
  }
}
resource "azurerm_storage_container" "vhreporting" {
  name                  = "vhreporting"
  storage_account_name  = data.azurerm_storage_account.core-sa.name
  container_access_type = "private"
}

#resource "azurerm_data_factory_pipeline" "MasterStaging" {
#  name            = "MasterStaging"
#  data_factory_id = azurerm_data_factory.adf.id
#  variables = {}
#  activities_json = <<JSON
#   [
#			{
#				"name": "GetConfig",
#				"type": "Lookup",
#				"dependsOn": [],
#				"policy": {
#					"timeout": "7.00:00:00",
#					"retry": 0,
#					"retryIntervalInSeconds": 30,
#					"secureOutput": false,
#					"secureInput": false
#				},
#				"userProperties": [],
#				"typeProperties": {
#					"source": {
#						"type": "AzureSqlSource",
#						"sqlReaderStoredProcedureName": "[dbo].[sp_GetAdfConfig]",
#						"storedProcedureParameters": {
#							"MasterPipeline": {
#								"type": "String",
#								"value": "Master_ErrorFile"
#							}
#						},
#						"queryTimeout": "02:00:00",
#						"partitionOption": "None"
#					},
#					"dataset": {
#						"referenceName": "AsqlTarget",
#						"type": "DatasetReference",
#						"parameters": {
#							"SchemaName": "dbo",
#							"TableName": "AdfConfig"
#						}
#					},
#					"firstRowOnly": false
#				}
#			},
#			{
#				"name": "ForEach1",
#				"type": "ForEach",
#				"dependsOn": [
#					{
#						"activity": "GetConfig",
#						"dependencyConditions": [
#							"Succeeded"
#						]
#					}
#				],
#				"userProperties": [],
#				"typeProperties": {
#					"items": {
#						"value": "@activity('GetConfig').output.value",
#						"type": "Expression"
#					},
#					"isSequential": false,
#					"batchCount": 4,
#					"activities": [
#						{
#							"name": "StageAndLoad",
#							"type": "ExecutePipeline",
#							"dependsOn": [],
#							"userProperties": [],
#							"typeProperties": {
#								"pipeline": {
#									"referenceName": "Child_StageAppInsightsError",
#									"type": "PipelineReference"
#								},
#								"waitOnCompletion": false,
#								"parameters": {
#									"DeltaDateTime": {
#										"value": "@{item().DeltaValue}",
#										"type": "Expression"
#									},
#									"TableName": {
#										"value": "@{item().TableName}",
#										"type": "Expression"
#									},
#									"ProcedureName": {
#										"value": "@{item().ProcedureName}",
#										"type": "Expression"
#									}
#								}
#							}
#						}
#					]
#				}
#			}
#		],
#  JSON
#}


