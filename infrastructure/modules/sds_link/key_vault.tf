

resource "azurerm_data_factory_linked_service_key_vault" "infra_core" {
  name                = "vhreporting-kv-link"
  data_factory_id     = var.adf_id
  key_vault_id        = data.azurerm_key_vault.infra_core.id
  resource_group_name = "vh-reporting-infra-${var.env}"
}