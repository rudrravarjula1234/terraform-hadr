variable "name" {
  type        = string
  description = "App Gateway name"
  default     = "agw-high-availability"
}

locals {
  backend_address_pool_name      = "vnet-high-availability-beap"
  frontend_port_name             = "vnet-high-availability-feport"
  frontend_ip_configuration_name = "vnet-high-availability-feip"
  http_setting_name              = "vnet-high-availability-be-htst"
  listener_name                  = "vnet-high-availability-httplstn"
  request_routing_rule_name      = "vnet-high-availability-rqrt"
  redirect_configuration_name    = "vnet-high-availability-rdrcfg"
}
variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
  default     = "vnet"
}

variable "pip_name" {
  type        = string
  description = "public ip name"
  default     = "pip"
}

variable "backend_ipaddress" {
  type        = list(string)
  description = "Backend Ip Addressess"
  default     = []
}
