variable "locations" {
  type        = map(string)
  description = "Primary location for the resource group"
  default     = { 1 : "East US", 2 : "West US" }
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "rg_hadr"
}
variable "vnet_name" {
  type        = string
  description = "vnet name"
  default     = "vnet_hadr"
}
variable "subnet_name" {
  type        = string
  description = "subnet name"
  default     = "subnet_hadr"
}
variable "public_ip_name" {
  type        = string
  description = "Ip name"
  default     = "public_ip_hadr"
}
variable "asp_name" {
  type        = string
  description = "app service plan name"
  default     = "asp_hadr"
}
variable "as_name" {
  type        = string
  description = "app service plan name"
  default     = "asp_hadr"
}

