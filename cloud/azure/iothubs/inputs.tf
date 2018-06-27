# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

# IOT Hub specific variables
variable "status_silenced" {
  description = "Groups to mute for IoT Hub status monitor"
  type        = "map"
  default     = {}
}

variable "status_message" {
  description = "Custom message for IoT Hub status monitor"
  type        = "string"
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for IoT Hub status [available values: min, max, sum or avg]"
  type        = "string"
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for IoT Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "total_devices_silenced" {
  description = "Groups to mute for IoT Hub total devices monitor"
  type        = "map"
  default     = {}
}

variable "total_devices_message" {
  description = "Custom message for IoT Hub total devices monitor"
  type        = "string"
  default     = ""
}

variable "total_devices_time_aggregator" {
  description = "Monitor aggregator for IoT Hub total devices [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "total_devices_timeframe" {
  description = "Monitor timeframe for IoT Hub total devices [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "too_many_d2c_telemetry_ingress_nosent_silenced" {
  description = "Groups to mute for IoT Hub unsent d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "too_many_d2c_telemetry_ingress_nosent_message" {
  description = "Custom message for IoT Hub unsent d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "too_many_d2c_telemetry_ingress_nosent_timeframe" {
  description = "Monitor timeframe for IoT Hub unsent d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_jobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed jobs monitor"
  type        = "map"
  default     = {}
}

variable "failed_jobs_rate_message" {
  description = "Custom message for IoT Hub failed jobs monitor"
  type        = "string"
  default     = ""
}

variable "failed_jobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_jobs_rate_threshold_warning" {
  description = "Jobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_jobs_rate_threshold_critical" {
  description = "Jobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_listjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed list jobs monitor"
  type        = "map"
  default     = {}
}

variable "failed_listjobs_rate_message" {
  description = "Custom message for IoT Hub failed list jobs monitor"
  type        = "string"
  default     = ""
}

variable "failed_listjobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed list jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_listjobs_rate_threshold_warning" {
  description = "ListJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_listjobs_rate_threshold_critical" {
  description = "ListJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_queryjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed query jobs monitor"
  type        = "map"
  default     = {}
}

variable "failed_queryjobs_rate_message" {
  description = "Custom message for IoT Hub failed query jobs monitor"
  type        = "string"
  default     = ""
}

variable "failed_queryjobs_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed query jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_queryjobs_rate_threshold_warning" {
  description = "QueryJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_queryjobs_rate_threshold_critical" {
  description = "QueryJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_c2d_methods_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d methods monitor"
  type        = "map"
  default     = {}
}

variable "failed_c2d_methods_rate_message" {
  description = "Custom message for IoT Hub failed c2d method monitor"
  type        = "string"
  default     = ""
}

variable "failed_c2d_methods_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d method [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_c2d_methods_rate_threshold_warning" {
  description = "C2D Methods Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_c2d_methods_rate_threshold_critical" {
  description = "C2D Methods Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_c2d_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin read monitor"
  type        = "map"
  default     = {}
}

variable "failed_c2d_twin_read_rate_message" {
  description = "Custom message for IoT Hub failed c2d twin read monitor"
  type        = "string"
  default     = ""
}

variable "failed_c2d_twin_read_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_c2d_twin_read_rate_threshold_warning" {
  description = "C2D Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_c2d_twin_read_rate_threshold_critical" {
  description = "C2D Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_c2d_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin update monitor"
  type        = "map"
  default     = {}
}

variable "failed_c2d_twin_update_rate_message" {
  description = "Custom message for IoT Hub failed c2d twin update monitor"
  type        = "string"
  default     = ""
}

variable "failed_c2d_twin_update_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed c2d twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_c2d_twin_update_rate_threshold_warning" {
  description = "C2D Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_c2d_twin_update_rate_threshold_critical" {
  description = "C2D Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_d2c_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin read monitor"
  type        = "map"
  default     = {}
}

variable "failed_d2c_twin_read_rate_message" {
  description = "Custom message for IoT Hub failed d2c twin read monitor"
  type        = "string"
  default     = ""
}

variable "failed_d2c_twin_read_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed d2c twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_d2c_twin_read_rate_threshold_warning" {
  description = "D2C Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_d2c_twin_read_rate_threshold_critical" {
  description = "D2C Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "failed_d2c_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin update monitor"
  type        = "map"
  default     = {}
}

variable "failed_d2c_twin_update_rate_message" {
  description = "Custom message for IoT Hub failed d2c twin update monitor"
  type        = "string"
  default     = ""
}

variable "failed_d2c_twin_update_rate_timeframe" {
  description = "Monitor timeframe for IoT Hub failed d2c twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_d2c_twin_update_rate_threshold_warning" {
  description = "D2C Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "failed_d2c_twin_update_rate_threshold_critical" {
  description = "D2C Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "dropped_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub dropped d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "dropped_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub dropped d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "dropped_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub dropped d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "dropped_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Dropped limit (warning threshold)"
  default     = 50
}

variable "dropped_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Dropped limit (critical threshold)"
  default     = 90
}

variable "orphaned_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub orphaned d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "orphaned_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub orphaned d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "orphaned_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub orphaned d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "orphaned_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Orphaned limit (warning threshold)"
  default     = 50
}

variable "orphaned_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Orphaned limit (critical threshold)"
  default     = 90
}

variable "invalid_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub invalid d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "invalid_d2c_telemetry_egress_message" {
  description = "Custom message for IoT Hub invalid d2c telemetry monitor"
  type        = "string"
  default     = ""
}

variable "invalid_d2c_telemetry_egress_timeframe" {
  description = "Monitor timeframe for IoT Hub invalid d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "invalid_d2c_telemetry_egress_rate_threshold_warning" {
  description = "D2C Telemetry Invalid limit (warning threshold)"
  default     = 50
}

variable "invalid_d2c_telemetry_egress_rate_threshold_critical" {
  description = "D2C Telemetry Invalid limit (critical threshold)"
  default     = 90
}
