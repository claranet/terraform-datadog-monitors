#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = string
}

variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "filter_tags_failover_unavailable" {
  description = "Tags used for filtering specific to the failover unavailable monitor which is only useful for master instances"
  default     = ""
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_group_delay" {
  description = "Delay in seconds for the new host evaluation"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "disk_utilization_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

#
# CPU
#

variable "cpu_utilization_message" {
  description = "Custom message for the CPU Utilization monitor"
  type        = string
  default     = ""
}

variable "cpu_utilization_time_aggregator" {
  description = "Time aggregator for the CPU Utilization monitor"
  type        = string
  default     = "avg"
}

variable "cpu_utilization_timeframe" {
  description = "Timeframe for the CPU Utilization monitor"
  type        = string
  default     = "last_15m"
}

variable "cpu_utilization_threshold_warning" {
  description = "CPU Utilization in percentage (warning threshold)"
  type        = string
  default     = 80
}

variable "cpu_utilization_threshold_critical" {
  description = "CPU Utilization in percentage (critical threshold)"
  type        = string
  default     = 90
}

variable "cpu_utilization_enabled" {
  description = "Flag to enable GCP Cloud SQL CPU Utilization monitor"
  type        = string
  default     = "true"
}

variable "cpu_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL CPU Utilization monitor"
  type        = list(string)
  default     = []
}

#
# DISK Utilization
#

variable "disk_utilization_message" {
  description = "Custom message for the Disk Utilization monitor"
  type        = string
  default     = ""
}

variable "disk_utilization_time_aggregator" {
  description = "Time aggregator for the Disk Utilization monitor"
  type        = string
  default     = "avg"
}

variable "disk_utilization_timeframe" {
  description = "Timeframe for the Disk Utilization monitor"
  type        = string
  default     = "last_5m"
}

variable "disk_utilization_threshold_warning" {
  description = "Disk Utilization in percentage (warning threshold)"
  type        = string
  default     = 80
}

variable "disk_utilization_threshold_critical" {
  description = "Disk Utilization in percentage (critical threshold)"
  type        = string
  default     = 90
}

variable "disk_utilization_enabled" {
  description = "Flag to enable GCP Cloud SQL Disk Utilization monitor"
  type        = string
  default     = "true"
}

variable "disk_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL CPU Utilization monitor"
  type        = list(string)
  default     = []
}

#
# DISK Utilization Forecast
#

variable "disk_utilization_forecast_message" {
  description = "Custom message for the Disk Utilization Forecast monitor"
  type        = string
  default     = ""
}

variable "disk_utilization_forecast_time_aggregator" {
  description = "Time aggregator for the Disk Utilization Forecast monitor"
  type        = string
  default     = "max"
}

variable "disk_utilization_forecast_timeframe" {
  description = "Timeframe for the Disk Utilization Forecast monitor"
  type        = string
  default     = "next_1w"
}

variable "disk_utilization_forecast_algorithm" {
  description = "Algorithm for the Disk Utilization Forecast monitor"
  type        = string
  default     = "linear"
}

variable "disk_utilization_forecast_deviations" {
  description = "Deviations for the Disk Utilization Forecast monitor"
  type        = string
  default     = 1
}

variable "disk_utilization_forecast_interval" {
  description = "Interval for the Disk Utilization Forecast monitor"
  type        = string
  default     = "60m"
}

variable "disk_utilization_forecast_linear_history" {
  description = "History for the Disk Utilization Forecast monitor"
  type        = string
  default     = "3d"
}

variable "disk_utilization_forecast_linear_model" {
  description = "Model for the Disk Utilization Forecast monitor"
  type        = string
  default     = "default"
}

variable "disk_utilization_forecast_seasonal_seasonality" {
  description = "Seasonality for the Disk Utilization Forecast monitor"
  type        = string
  default     = "weekly"
}

variable "disk_utilization_forecast_threshold_critical" {
  description = "Disk Utilization Forecast in percentage (critical threshold)"
  type        = string
  default     = 80
}

variable "disk_utilization_forecast_threshold_critical_recovery" {
  description = "Disk Utilization Forecast in percentage (recovery threshold)"
  type        = string
  default     = 72
}

variable "disk_utilization_forecast_enabled" {
  description = "Flag to enable GCP Cloud SQL Disk Utilization Forecast monitor"
  type        = string
  default     = "true"
}

variable "disk_utilization_forecast_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Disk Utilization Forecast monitor"
  type        = list(string)
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

variable "memory_utilization_enabled" {
  description = "Flag to enable GCP Cloud SQL Memory Utilization monitor"
  type        = string
  default     = "true"
}

variable "memory_utilization_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Memory Utilization monitor"
  type        = list(string)
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
  type        = string
  default     = "linear"
}

variable "memory_utilization_forecast_deviations" {
  description = "Deviations for the Memory Utilization Forecast monitor"
  type        = string
  default     = 1
}

variable "memory_utilization_forecast_interval" {
  description = "Interval for the Memory Utilization Forecast monitor"
  type        = string
  default     = "30m"
}

variable "memory_utilization_forecast_linear_history" {
  description = "History for the Memory Utilization Forecast monitor"
  type        = string
  default     = "12h"
}

variable "memory_utilization_forecast_linear_model" {
  description = "Model for the Memory Utilization Forecast monitor"
  type        = string
  default     = "default"
}

variable "memory_utilization_forecast_seasonal_seasonality" {
  description = "Seasonality for the Memory Utilization Forecast monitor"
  type        = string
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

variable "memory_utilization_forecast_enabled" {
  description = "Flag to enable GCP Cloud SQL Memory Utilization Forecast monitor"
  type        = string
  default     = "false"
}

variable "memory_utilization_forecast_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor"
  type        = list(string)
  default     = []
}

#
# Failover Unavailable
#

variable "failover_unavailable_message" {
  description = "Custom message for the Failover Unavailable monitor"
  type        = string
  default     = ""
}

variable "failover_unavailable_time_aggregator" {
  description = "Time aggreggator for the Failover Unavailable monitor"
  type        = string
  default     = "max"
}

variable "failover_unavailable_timeframe" {
  description = "Timeframe for the Failover Unavailable monitor"
  type        = string
  default     = "last_10m"
}

variable "failover_unavailable_threshold_critical" {
  description = "Failover Unavailable critical threshold"
  type        = string
  default     = 0
}

variable "failover_unavailable_enabled" {
  description = "Flag to enable GCP Cloud SQL Failover Unavailable monitor"
  type        = string
  default     = "true"
}

variable "failover_unavailable_extra_tags" {
  description = "Extra tags for GCP Cloud SQL Failover Unavailable monitor"
  type        = list(string)
  default     = []
}

