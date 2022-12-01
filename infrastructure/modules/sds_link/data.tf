data "azurerm_key_vault" "infra_core" {
  name                = "vh-infra-core-${var.env}"
  resource_group_name = "vh-infra-core-${var.env}"
}

data "azurerm_sql_server" "infra_core" {
  name                = "vh-infra-core-${var.env}"
  resource_group_name = "vh-infra-core-${var.env}"
}
data "azurerm_client_config" "current" {}
data "azurerm_client_config" "vh" {
  provider = azurerm.vh
}