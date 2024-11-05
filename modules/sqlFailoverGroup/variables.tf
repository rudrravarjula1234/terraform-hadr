variable "name" {
  type        = string
  description = "Fail over group name"
  default     = "fg-hrdr"
}

variable "sql_server_name" {
  type        = string
  description = "Fail over group name"
  default     = "sql"
}

variable "rg_name" {
  type        = string
  description = "Fail over group name"
  default     = "rg"
}

variable "partner_server_names" {
  type        = list(string)
  description = "List of other regions"
  default     = []
}

variable "databases" {
  type    = list(string)
  default = []
}
