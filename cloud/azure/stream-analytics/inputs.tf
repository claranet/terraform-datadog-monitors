variable "message" {}

variable "environment" {}

variable "notify_no_data" {
  default = "false"
}

variable "filter_tags" {
  default = "*"
}

variable "delay" {
  default = "600"
}

variable "su_utilization_threshold_warning" {
  default = 60
}

variable "su_utilization_threshold_critical" {
  default = 80
}

variable "function_requests_threshold_warning" {
  default = 0
}

variable "function_requests_threshold_critical" {
  default = 10
}

variable "conversion_errors_threshold_warning" {
  default = 0
}

variable "conversion_errors_threshold_critical" {
  default = 10
}

variable "runtime_errors_threshold_warning" {
  default = 0
}

variable "runtime_errors_threshold_critical" {
  default = 10
}
