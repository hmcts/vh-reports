data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "core-kv" {
  name                = "vhcoreinfra${var.env}"
  resource_group_name = "vh-core-infra-${var.env}"
}

resource "azurerm_resource_group" "vh-reporting-rg" {
  name     = "vh-reporting-infra-${var.env}"
  location = "${var.location}"
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



