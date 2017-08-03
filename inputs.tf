variable "critical_escalation_group" {}
variable "warning_escalation_group" {}

variable "dd_linux_basics" {
  default = "disabled"
}

variable "dd_custom_cpu" {
  type = "map"
  default = {
    status = "enabled"
  }
}

variable "rds-mysql_basics" {
  default = "disabled"
}
