resource "azurerm_key_vault_access_policy" "kvaccess" {
  key_vault_id = data.azurerm_key_vault.infra_core.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.adf_mi_principal_id

  key_permissions = [
    "Get", "List",
  ]

  secret_permissions = [
    "Get", "List",
  ]

}

resource "azurerm_role_assignment" "kv_access" {
  scope                = data.azurerm_key_vault.infra_core.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.vh.object_id
}

resource "azurerm_data_factory_linked_service_key_vault" "infra_core" {
  provider            = azurerm.vh
  name                = "vhreporting-kv-link"
  data_factory_id     = var.adf_id
  key_vault_id        = data.azurerm_key_vault.infra_core.id
  resource_group_name = "vh-reporting-infra-${var.env}"
}