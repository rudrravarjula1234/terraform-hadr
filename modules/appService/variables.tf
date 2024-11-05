variable "name" {
  type        = string
  description = "App Service name"
  default     = "alwp-high-availability-dr"
}

variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}

variable "asp_name" {
  type        = string
  description = "asp name"
  default     = "asp"
}
