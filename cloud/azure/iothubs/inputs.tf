variable "environment" {}

variable "stack" {}

variable "client_name" {}

variable "delay" {
  default = 600
}

## IOT hubs
variable "jobs_failed_threshold_warning" {
  default = 0
}

variable "jobs_failed_threshold_critical" {
  default = 10
}

variable "jobs_failed_message" {}

variable "listjobs_failed_threshold_warning" {
  default = 0
}

variable "listjobs_failed_threshold_critical" {
  default = 10
}

variable "listjobs_failed_message" {}

variable "queryjobs_failed_threshold_warning" {
  default = 0
}

variable "queryjobs_failed_threshold_critical" {
  default = 10
}

variable "queryjobs_failed_message" {}

variable "status_message" {}

variable "total_devices_message" {}

variable "c2d_methods_failed_message" {}

variable "c2d_methods_failed_threshold_warning" {
  default = 0
}

variable "c2d_methods_failed_threshold_critical" {
  default = 10
}