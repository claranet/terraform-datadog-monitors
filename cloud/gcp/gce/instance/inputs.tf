#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds for the new host evaluation"
  default     = 300
}

#
# CPU
#

variable "cpu_utilization_message" {
  description = "Custom message for the CPU Utilization monitor"
  type        = "string"
  default     = ""
}

variable "cpu_utilization_time_aggregator" {
  description = "Time aggregator for the CPU Utilization monitor"
  type        = "string"
  default     = "avg"
}

variable "cpu_utilization_timeframe" {
  description = "Timeframe for the CPU Utilization monitor"
  type        = "string"
  default     = "last_15m"
}

variable "cpu_utilization_threshold_warning" {
  description = "CPU Utilization in percentage (warning threshold)"
  type        = "string"
  default     = 80
}

variable "cpu_utilization_threshold_critical" {
  description = "CPU Utilization in percentage (critical threshold)"
  type        = "string"
  default     = 90
}

variable "cpu_utilization_silenced" {
  description = "Groups to mute for CPU Utilization monitor"
  type        = "map"
  default     = {}
}

variable "cpu_utilization_enabled" {
  description = "Flag to enable CPU Utilization monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_utilization_extra_tags" {
  description = "Extra tags for CPU Utilization monitor"
  type        = "list"
  default     = []
}

#
# Disk Throttled Bps
#

variable "disk_throttled_bps_message" {
  description = "Custom message for the Disk Throttled Bps monitor"
  type        = "string"
  default     = ""
}

variable "disk_throttled_bps_time_aggregator" {
  description = "Time aggregator for the Disk Throttled Bps monitor"
  type        = "string"
  default     = "min"
}

variable "disk_throttled_bps_timeframe" {
  description = "Timeframe for the Disk Throttled Bps monitor"
  type        = "string"
  default     = "last_15m"
}

variable "disk_throttled_bps_threshold_warning" {
  description = "Disk Throttled Bps in percentage (warning threshold)"
  type        = "string"
  default     = 30
}

variable "disk_throttled_bps_threshold_critical" {
  description = "Disk Throttled Bps in percentage (critical threshold)"
  type        = "string"
  default     = 50
}

variable "disk_throttled_bps_silenced" {
  description = "Groups to mute for Disk Throttled Bps monitor"
  type        = "map"
  default     = {}
}

variable "disk_throttled_bps_enabled" {
  description = "Flag to enable Disk Throttled Bps monitor"
  type        = "string"
  default     = "true"
}

variable "disk_throttled_bps_extra_tags" {
  description = "Extra tags for Disk Throttled Bps monitor"
  type        = "list"
  default     = []
}

variable "disk_throttled_bps_notify_no_data" {
  description = "Flag to enable notification for no data on Disk Throttled Bps monitor"
  type        = "string"
  default     = "false"
}

#
# Disk Throttled OPS
#

variable "disk_throttled_ops_message" {
  description = "Custom message for the Disk Throttled OPS monitor"
  type        = "string"
  default     = ""
}

variable "disk_throttled_ops_time_aggregator" {
  description = "Time aggregator for the Disk Throttled OPS monitor"
  type        = "string"
  default     = "min"
}

variable "disk_throttled_ops_timeframe" {
  description = "Timeframe for the Disk Throttled OPS monitor"
  type        = "string"
  default     = "last_15m"
}

variable "disk_throttled_ops_threshold_warning" {
  description = "Disk Throttled OPS in percentage (warning threshold)"
  type        = "string"
  default     = 30
}

variable "disk_throttled_ops_threshold_critical" {
  description = "Disk Throttled OPS in percentage (critical threshold)"
  type        = "string"
  default     = 50
}

variable "disk_throttled_ops_silenced" {
  description = "Groups to mute for Disk Throttled OPS monitor"
  type        = "map"
  default     = {}
}

variable "disk_throttled_ops_enabled" {
  description = "Flag to enable Disk Throttled OPS monitor"
  type        = "string"
  default     = "true"
}

variable "disk_throttled_ops_extra_tags" {
  description = "Extra tags for Disk Throttled OPS monitor"
  type        = "list"
  default     = []
}

variable "disk_throttled_ops_notify_no_data" {
  description = "Flag to enable notification for no data on Disk Throttled OPS monitor"
  type        = "string"
  default     = "false"
}
