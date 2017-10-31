variable "environment" {}

variable "stack" {}

variable "client_name" {}

variable "subscription_id" {}

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

variable "c2d_methods_failed_threshold_warning" {
  default = 0
}

variable "c2d_methods_failed_threshold_critical" {
  default = 10
}

variable "c2d_methods_failed_message" {}

variable "c2d_twin_read_failed_threshold_warning" {
  default = 0
}

variable "c2d_twin_read_failed_threshold_critical" {
  default = 10
}

variable "c2d_twin_read_failed_message" {}

variable "c2d_twin_update_failed_threshold_warning" {
  default = 0
}

variable "c2d_twin_update_failed_threshold_critical" {
  default = 10
}

variable "c2d_twin_update_failed_message" {}

variable "d2c_twin_read_failed_threshold_warning" {
  default = 0
}

variable "d2c_twin_read_failed_threshold_critical" {
  default = 10
}

variable "d2c_twin_read_failed_message" {}

variable "d2c_twin_update_failed_threshold_warning" {
  default = 0
}

variable "d2c_twin_update_failed_threshold_critical" {
  default = 10
}

variable "d2c_twin_update_failed_message" {}

variable "d2c_telemetry_egress_dropped_threshold_warning" {
  default = 500
}

variable "d2c_telemetry_egress_dropped_threshold_critical" {
  default = 1000
}

variable "d2c_telemetry_egress_dropped_message" {}

variable "d2c_telemetry_egress_orphaned_threshold_warning" {
  default = 500
}

variable "d2c_telemetry_egress_orphaned_threshold_critical" {
  default = 1000
}

variable "d2c_telemetry_egress_orphaned_message" {}

variable "d2c_telemetry_egress_invalid_threshold_warning" {
  default = 500
}

variable "d2c_telemetry_egress_invalid_threshold_critical" {
  default = 1000
}

variable "d2c_telemetry_egress_invalid_message" {}

variable "d2c_telemetry_egress_fallback_threshold_warning" {
  default = 500
}

variable "d2c_telemetry_egress_fallback_threshold_critical" {
  default = 1000
}

variable "d2c_telemetry_egress_fallback_message" {}

variable "d2c_telemetry_ingress_nosent_message" {}
