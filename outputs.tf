output "name" {
    description = "CosmosDB account name"
    value = azurerm_cosmosdb_account.cosmosdb_account.name
}

output "id" {
    description = "The CosmosDB Account ID"
    value = azurerm_cosmosdb_account.cosmosdb_account.id
}

output "endpoint" {
    description = "The endpoint used to connect to the CosmosDB account."
    value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
}

output "read_endpoints" {
    description = "A list of read endpoints available for this CosmosDB account."
    value = azurerm_cosmosdb_account.cosmosdb_account.read_endpoints
}

output "write_endpoints" {
    description = "A list of write endpoints available for this CosmosDB account"
    value = azurerm_cosmosdb_account.cosmosdb_account.write_endpoints


}

output "primary_key" {
    description = "The Primary key for the CosmosDB Account."
    value = azurerm_cosmosdb_account.cosmosdb_account.primary_key
}

output "secondary_key" {
    description = "The Secondary key for the CosmosDB Account."
    value = azurerm_cosmosdb_account.cosmosdb_account.secondary_key
}

output "primary_readonly_key" {
    description = "The Primary read-only Key for the CosmosDB Account."
    value = azurerm_cosmosdb_account.cosmosdb_account.primary_readonly_key
}

output "secondary_readonly_key" {
    description = "The Secondary read-only key for the CosmosDB Account"
    value = azurerm_cosmosdb_account.cosmosdb_account.secondary_readonly_key

}

output "connection_strings" {
    description = "A list of connection strings available for this CosmosDB account."
    value = azurerm_cosmosdb_account.cosmosdb_account.connection_strings
}
