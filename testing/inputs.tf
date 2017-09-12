variable environment {}

variable region {}

variable "critical_escalation_group" {
  default = "@pagerduty_HODummy"
}
variable "warning_escalation_group" {
  default = "@pagerduty_HNODummy"
}

variable "datadog_api_key" {}
variable "datadog_app_key" {}

variable "dd_linux_basics" {
  default = "enabled"
}

variable "dd_aws_rds" {
  default = "enabled"
}

