variable "name" {
  type        = string
  description = "Name of the trafic manager profile"
  default     = "tmp-high-availability-dr"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    environment = "development"
    project     = "high-availability-dr"
  }
}

variable "endpoints" {
  type = map(object({
    target_ip = string
    weight    = number
  }))
  description = "Availabulity Endpoints"
  default = {
    "ep-high-availability" = {
      "target_ip" = ""
      "weight"    = 100
    },
    "ep-disaster-recovery" = {
      "target_ip" = ""
      "weight"    = 100
    }
  }
}

variable "rg_name" {
  type        = string
  description = "rg name"
  default     = "rg"
}
