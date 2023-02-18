resource "azurerm_private_endpoint" "registrypep" {
  count               = var.enable_private_endpoint == true ? 1 : 0
  name                = format("pe-%s", local.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = merge(var.default_tags, var.extra_tags)
  private_dns_zone_group {
    name                 = "cosmos-db-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name                           = "cosmosdbprivatelink"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_cosmosdb_account.cosmosdb_account.id
    subresource_names              = ["MongoDB"]
  }
}