variable "name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-high-availability-dr"
}

variable "location" {
  type        = string
  description = "Primary location for the resource group"
  default     = "East US"
}
