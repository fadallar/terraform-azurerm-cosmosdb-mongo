variable "enable_private_endpoint" {
  description = "Wether the container registry is using a priavte endpoint"
  type        = bool
  default     = true
}

variable "private_dns_zone_id" {
  description = "Id of the private DNS Zone  to be used by the container registry private endpoint"
  type        = string
  default = null
}

variable "private_endpoint_subnet_id" {
  description = "Id for the subnet used by the container registry private endpoint"
  type        = string
  default = null
}