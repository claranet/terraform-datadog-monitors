#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

#
# Filter variables
#
variable "project_id" {
  type        = "string"
  description = "ID of the GCP Project"
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
  description = "Groups to mute for GCP Cloud SQL CPU Utilization monitor"
  type        = "map"
  default     = {}
}

variable "cpu_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL CPU Utilization monitor"
  type        = "list"
  default     = []
}

#
# DISK Utilization
#

variable "disk_utilization_message" {
  description = "Custom message for the Disk Utilization monitor"
  type        = "string"
  default     = ""
}

variable "disk_utilization_time_aggregator" {
  description = "Time aggregator for the Disk Utilization monitor"
  type        = "string"
  default     = "avg"
}

variable "disk_utilization_timeframe" {
  description = "Timeframe for the Disk Utilization monitor"
  type        = "string"
  default     = "last_5m"
}

variable "disk_utilization_threshold_warning" {
  description = "Disk Utilization in percentage (warning threshold)"
  type        = "string"
  default     = 80
}

variable "disk_utilization_threshold_critical" {
  description = "Disk Utilization in percentage (critical threshold)"
  type        = "string"
  default     = 90
}

variable "disk_utilization_silenced" {
  description = "Groups to mute for GCP Cloud SQL Disk Utilization monitor"
  type        = "map"
  default     = {}
}

variable "disk_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL CPU Utilization monitor"
  type        = "list"
  default     = []
}

#
# DISK Utilization Forecast
#

variable "disk_utilization_forecast_message" {
  description = "Custom message for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = ""
}

variable "disk_utilization_forecast_time_aggregator" {
  description = "Time aggregator for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "max"
}

variable "disk_utilization_forecast_timeframe" {
  description = "Timeframe for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "next_1w"
}

variable "disk_utilization_forecast_algorithm" {
  description = "Algorithm for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "linear"
}

variable "disk_utilization_forecast_deviations" {
  description = "Deviations for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = 1
}

variable "disk_utilization_forecast_interval" {
  description = "Interval for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "60m"
}

variable "disk_utilization_forecast_linear_history" {
  description = "History for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "3d"
}

variable "disk_utilization_forecast_linear_model" {
  description = "Model for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "default"
}

variable "disk_utilization_forecast_seasonal_seasonality" {
  description = "Seasonality for the Disk Utilization Forecast monitor"
  type        = "string"
  default     = "weekly"
}

variable "disk_utilization_forecast_threshold_critical" {
  description = "Disk Utilization Forecast in percentage (critical threshold)"
  type        = "string"
  default     = 80
}

variable "disk_utilization_forecast_threshold_critical_recovery" {
  description = "Disk Utilization Forecast in percentage (recovery threshold)"
  type        = "string"
  default     = 72
}

variable "disk_utilization_forecast_silenced" {
  description = "Groups to mute for GCP Cloud SQL Disk Utilization Forecast monitor"
  type        = "map"
  default     = {}
}

variable "disk_utilization_forecast_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Disk Utilization Forecast monitor"
  type        = "list"
  default     = []
}

#
# Memory Utilization
#

variable "memory_utilization_message" {
  description = "Custom message for the Memory Utilization monitor"
  default     = ""
}

variable "memory_utilization_time_aggregator" {
  description = "Time aggregator for the Memory Utilization monitor"
  default     = "avg"
}

variable "memory_utilization_timeframe" {
  description = "Timeframe for the Memory Utilization monitor"
  default     = "last_5m"
}

variable "memory_utilization_threshold_warning" {
  description = "Memory Utilization in percentage (warning threshold)"
  default     = 80
}

variable "memory_utilization_threshold_critical" {
  description = "Memory Utilization in percentage (critical threshold)"
  default     = 90
}

variable "memory_utilization_silenced" {
  description = "Groups to mute for GCP Cloud SQL Memory Utilization monitor"
  type        = "map"
  default     = {}
}

variable "memory_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Memory Utilization monitor"
  type        = "list"
  default     = []
}

#
# Memory Utilization Forecast
#

variable "memory_utilization_forecast_message" {
  description = "Custom message for the Memory Utilization Forecast monitor"
  default     = ""
}

variable "memory_utilization_forecast_time_aggregator" {
  description = "Time aggregator for the Memory Utilization Forecast monitor"
  default     = "max"
}

variable "memory_utilization_forecast_timeframe" {
  description = "Timeframe for the Memory Utilization Forecast monitor"
  default     = "next_3d"
}

variable "memory_utilization_forecast_algorithm" {
  description = "Algorithm for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = "linear"
}

variable "memory_utilization_forecast_deviations" {
  description = "Deviations for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = 1
}

variable "memory_utilization_forecast_interval" {
  description = "Interval for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = "30m"
}

variable "memory_utilization_forecast_linear_history" {
  description = "History for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = "12h"
}

variable "memory_utilization_forecast_linear_model" {
  description = "Model for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = "default"
}

variable "memory_utilization_forecast_seasonal_seasonality" {
  description = "Seasonality for the Memory Utilization Forecast monitor"
  type        = "string"
  default     = "weekly"
}

variable "memory_utilization_forecast_threshold_critical" {
  description = "Memory Utilization Forecast in percentage (warning threshold)"
  default     = 90
}

variable "memory_utilization_forecast_threshold_critical_recovery" {
  description = "Memory Utilization Forecast in percentage (recovery threshold)"
  default     = 81
}

variable "memory_utilization_forecast_silenced" {
  description = "Groups to mute for GCP Cloud SQL Memory Utilization Forecast monitor"
  type        = "map"
  default     = {}
}

variable "memory_utilization_forecast_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor"
  type        = "list"
  default     = []
}

#
# Failover Unavailable
#

variable "failover_unavailable_message" {
  description = "Custom message for the Failover Unavailable monitor"
  type        = "string"
  default     = ""
}

variable "failover_unavailable_time_aggregator" {
  description = "Time aggreggator for the Failover Unavailable monitor"
  type        = "string"
  default     = "max"
}

variable "failover_unavailable_timeframe" {
  description = "Timeframe for the Failover Unavailable monitor"
  type        = "string"
  default     = "last_5m"
}

variable "failover_unavailable_threshold_critical" {
  description = "Failover Unavailable critical threshold"
  type        = "string"
  default     = 0
}

variable "failover_unavailable_silenced" {
  description = "Groups to mute for GCP Cloud SQL Failover Unavailable monitor"
  type        = "map"
  default     = {}
}

variable "failover_unavailable_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Failover Unavailable monitor"
  type        = "list"
  default     = []
}
