variable "hno_escalation_group" {}

variable "ho_escalation_group" {}

variable "environment" {}

variable "subscription_id" {}

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