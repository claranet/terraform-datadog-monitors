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

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "system_memory_usage_ratio_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 20
}

#
# System memory usage ratio
#

variable "system_memory_usage_ratio_message" {
  description = "Custom message for Memorystore Redis System memory usage ratio monitor"
  type        = string
  default     = ""
}

variable "system_memory_usage_ratio_time_aggregator" {
  description = "Time aggregator for Memorystore Redis System memory usage ratio monitor"
  type        = string
  default     = "min"
}

variable "system_memory_usage_ratio_timeframe" {
  description = "Timeframe for Memorystore Redis System memory usage ratio monitor"
  type        = string
  default     = "last_10m"
}

variable "system_memory_usage_ratio_threshold_warning" {
  description = "Memorystore Redis System memory usage ratio warning threshold"
  type        = string
  default     = 80
}

variable "system_memory_usage_ratio_threshold_critical" {
  description = "Memorystore Redis System memory usage ratio critical threshold"
  type        = string
  default     = 90
}

variable "system_memory_usage_ratio_enabled" {
  description = "Flag to enable GCP Memorystore Redis System memory usage ratio monitor"
  type        = string
  default     = "true"
}

variable "system_memory_usage_ratio_extra_tags" {
  description = "Extra tags for GCP Memorystore Redis System memory usage ratio monitor"
  type        = list(string)
  default     = []
}

