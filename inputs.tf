variable "critical_escalation_group" {}
variable "warning_escalation_group" {}

variable "dd_linux_basics" {
  default = "disabled"
}

variable "dd_custom_cpu" {
  type = "map"
  default = {
    status = "disabled"
  }
}
variable "dd_custom_memory" {
  type = "map"
  default = {
    status = "disabled"
  }
}


variable "dd_rds_mysql_basics" {
  default = "disabled"
}
variable "dd_custom_rds-mysql" {
  type = "map"
  default = {
    status = "disabled"
  }
}

