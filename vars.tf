# Default Azure Location
variable "azure_location" {
  type        = "string"
  description = "Azure datacenter to deploy to."
  default     = "westeurope"
}

# Infrastructure Version
variable "version" {
  type    = "string"
  default = "0.1.0"
}

# Environment
variable "environment" {
  type    = "string"
  default = "nft"
}

# Tenant
variable "tenant" {
  type    = "string"
  default = "demo"
}
