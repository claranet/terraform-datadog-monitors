variable "critical_escalation_group" {}

variable "warning_escalation_group" {}

variable "environment" {}

variable "stack" {}

variable "client_name" {}

## IOT hubs
variable "delay" {
  default = 600
}

variable "warning_jobs_failed" {
  default = 5
}

variable "critical_jobs_failed" {
  default = 10
}

variable "warning_listjobs_failed" {
  default = 5
}

variable "critical_listjobs_failed" {
  default = 10
}

variable "warning_queryjobs_failed" {
  default = 5
}

variable "critical_queryjobs_failed" {
  default = 10
}