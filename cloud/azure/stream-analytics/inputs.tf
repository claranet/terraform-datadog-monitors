variable "hno_escalation_group" {}
variable "ho_escalation_group" {}

variable "environment" {}

variable "notify_no_data" {
  default = "false"
}

variable "delay" {
  default = "600"
}

variable "su_utilization_warning" {
  default = 60
}

variable "su_utilization_critical" {
  default = 80
}

variable "failed_function_requests_warning" {
  default = 0
}

variable "failed_function_requests_critical" {
  default = 10
}

variable "conversion_errors_warning" {
  default = 0
}

variable "conversion_errors_critical" {
  default = 10
}

variable "runtime_errors_warning" {
  default = 0
}

variable "runtime_errors_critical" {
  default = 10
}
