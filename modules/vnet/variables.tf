variable "vnet_name" {
  type        = string
  description = "Name of the Virtual network"
  default     = "vnet-high-availability-dr"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "subnet-high-availability-dr"
}

variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}
