variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}

#variable "create_mode" {
#    description = "The creation mode for the CosmosDB Account. Possible values are Default and Restore. Changing this forces a new resource to be created."
#    type = string
#    default = "Default"  #Create_mode only works when backup.type is Continuous
#}

variable "default_identity_type" {
    description =  "The default identity for accessing Key Vault. Possible values are FirstPartyIdentity, SystemAssignedIdentity, UserAssignedIdentity."
    default = "UserAssignedIdentity"
    type = string
}

variable "enable_automatic_failover" {
    description = "Enable automatic failover for this Cosmos DB account."
    default = false
    type = bool
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account"
  type        = bool
  default     = false
}

variable "virtual_network_rule" {
  description = "Specifies a virtual_network_rules resource used to define which subnets are allowed to access this CosmosDB account"
  type = list(object({
    id                                   = string,
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = null
}

variable "enable_multiple_write_locations" {
    description = "Enable multiple write locations for this Cosmos DB account."
    type = bool
    default = false
}

variable "mongo_server_version" {
    description = "The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2."
    type = string
    default = null
    validation {
        condition     = try(contains(["4.2", "4.0", "3.6","3.2"], var.mongo_server_version),true)
        error_message = ""
    }
}

variable "access_key_metadata_writes_enabled" {
    description = "Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?"
    type = bool
    default = true
}

variable "network_acl_bypass_for_azure_services" {
    description = "If Azure services can bypass ACLs"
    type = bool
    default = true
}

variable "network_acl_bypass_ids" {
    description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
    type = list(string)
    default = null
}

variable "local_authentication_disabled" {
    description = "Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication. Defaults to false. Can be set only when using the SQL API."
    type = bool
    default = true
}
##########################

variable "zone_redundancy_enabled" {
  description = "True to enabled zone redundancy on default primary location"
  type        = bool
  default     = true
}

variable "geo_locations" {
  description = "List of map of geo locations and other properties to create primary and secodanry databasees."
  type        = any
  default = [
    {
      geo_location      = "westeurope"
      failover_priority = 0
      zone_redundant    = false
    },
  ]
}

variable "capabilities" {
  type        = list(string)
  description = <<EOD
Configures the capabilities to enable for this Cosmos DB account:
Possible values are
  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,
  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,
  MongoDBv3.4 and mongoEnableDocLevelTTL.
EOD
  default     = []
}

variable "allowed_cidrs" {
  type        = list(string)
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  default     = []
}

variable "consistency_policy_level" {
  description = "Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`"
  type        = string
  default     = "BoundedStaleness"
}

variable "consistency_policy_max_interval_in_seconds" {
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 10
}

variable "consistency_policy_max_staleness_prefix" {
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 200
}

variable "backup" {
  description = "Backup block with type (Continuous / Periodic), interval_in_minutes and retention_in_hours keys"
  type = object({
    type                = string
    interval_in_minutes = number
    retention_in_hours  = number
  })
  default = {
    type                = "Periodic"
    interval_in_minutes = 3 * 60
    retention_in_hours  = 7 * 24
  }
}

variable "analytical_storage_enabled" {
  description = "Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "analytical_storage_type" {
  description = "The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`."
  type        = string
  default     = null

  validation {
    condition     = try(contains(["FullFidelity", "WellDefined"], var.analytical_storage_type), true)
    error_message = "The `analytical_storage_type` value must be valid. Possible values are `FullFidelity` and `WellDefined`."
  }
}

variable "identity_type" {
  description = "CosmosDB identity type. Possible values for type are: `null` and `SystemAssigned`."
  type        = string
  default     = "SystemAssigned"
}

variable "public_network_access_enabled" {
  description = "Enable public access"
  type = bool
  default = false
}