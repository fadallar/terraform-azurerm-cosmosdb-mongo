variable "public_network_access_enabled" {
  description = "Enable public access"
  type        = bool
  default     = false
}

variable "enable_private_endpoint" {
  description = "Wether the container registry is using a priavte endpoint"
  type        = bool
  default     = true
}

variable "private_dns_zone_id" {
  description = "Id of the private DNS Zone  to be used by the container registry private endpoint"
  type        = string
  default     = null
}

variable "private_endpoint_subnet_id" {
  description = "Id for the subnet used by the container registry private endpoint"
  type        = string
  default     = null
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

variable "network_acl_bypass_for_azure_services" {
  description = "If Azure services can bypass ACLs"
  type        = bool
  default     = true
}

variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  type        = list(string)
  default     = null
}

variable "allowed_cidrs" {
  type        = list(string)
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  default     = []
}
