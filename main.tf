resource "azurerm_cosmosdb_account" "cosmosdb_account" {
    name                      = local.name
    location                  = var.location
    resource_group_name       = var.resource_group_name
    offer_type                = "Standard"  ## Only options available
    kind                      = "MongoDB"
    mongo_server_version = var.kind == "MongoDB"
    
    create_mode = var.create_mode
    default_identity_type = var.default_identity_type
    access_key_metadata_writes_enabled = var.access_key_metadata_writes_enabled
    local_authentication_disabled = var.local_authentication_disabled

    public_network_access_enabled = var.public_network_access_enabled
    is_virtual_network_filter_enabled  = var.is_virtual_network_filter_enabled
    network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
    ip_range_filter = join(",", var.allowed_cidrs)
    network_acl_bypass_ids                = var.network_acl_bypass_ids

    dynamic "virtual_network_rule" {
      for_each = var.virtual_network_rule != null ? toset(var.virtual_network_rule) : []
      content {
        id                                   = virtual_network_rule.value.id
        ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
      }
    }

    enable_automatic_failover = var.enable_automatic_failover
    enable_multiple_write_locations = var.enable_multiple_write_locations

    dynamic "geo_location" {
      for_each = var.failover_locations != null ? var.failover_locations : local.default_failover_locations
      content {
        location          = geo_location.value.location
        failover_priority = lookup(geo_location.value, "priority", 0)
        zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
      }
    }
  
    dynamic "analytical_storage" {
      for_each = var.analytical_storage_type != null ? ["enabled"] : []
      content {
        schema_type = var.analytical_storage_type
      }
    }

    consistency_policy {
      consistency_level       = var.consistency_policy_level
      max_interval_in_seconds = var.consistency_policy_max_interval_in_seconds
      max_staleness_prefix    = var.consistency_policy_max_staleness_prefix
    }

    dynamic "capabilities" {
      for_each = toset(var.capabilities)
      content {
        name = capabilities.key
      }
    }

    dynamic "backup" {
      for_each = var.backup != null ? ["enabled"] : []
      content {
        type                = lookup(var.backup, "type", null)
        interval_in_minutes = lookup(var.backup, "interval_in_minutes", null)
        retention_in_hours  = lookup(var.backup, "retention_in_hours", null)
      }
    }

    dynamic "identity" {
      for_each = var.identity_type != null ? ["enabled"] : []
      content {
        type = var.identity_type
      }
    }

  tags = merge(var.default_tags, var.extra_tags)
}