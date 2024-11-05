variable "name" {
  type        = string
  description = "App Service Plan name"
  default     = "myapp-service-plan"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    environment = "development"
    project     = "high-availability-dr"
  }
}


variable "app_service_sku" {
  type    = string
  default = "S1"
}

variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

