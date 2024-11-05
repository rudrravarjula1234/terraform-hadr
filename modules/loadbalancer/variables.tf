# Load Balancer Variables
variable "load_balancer_name" {
  type        = string
  description = "Name of the Azure Load Balancer"
  default     = "myapp-load-balancer"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    environment = "development"
    project     = "high-availability-dr"
  }
}
