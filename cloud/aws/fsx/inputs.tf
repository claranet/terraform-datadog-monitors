# Datadog global variables

variable "environment" {
  description = "Architecture environment"
  type        = string
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
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

variable "fsx_windows_free_storage_capacity_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Datadog monitors variables

variable "fsx_windows_free_storage_capacity_enabled" {
  description = "Flag to enable FSX for Windows free storage capacity monitor"
  type        = string
  default     = "true"
}

variable "fsx_windows_free_storage_capacity_extra_tags" {
  description = "Extra tags for FSX for Windows free storage capacity monitor"
  type        = list(string)
  default     = []
}

variable "fsx_windows_free_storage_capacity_message" {
  description = "Custom message for FSX for Windows free storage capacity monitor"
  type        = string
  default     = ""
}

variable "fsx_windows_free_storage_capacity_time_aggregator" {
  description = "Monitor aggregator for FSX for Windows free storage capacity [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "fsx_windows_free_storage_capacity_timeframe" {
  description = "Monitor timeframe for FSX for Windows free storage capacity [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "fsx_windows_free_storage_capacity_threshold_warning" {
  description = "FSX for Windows free storage capacity warning threshold in gigabytes"
  default     = 20
}

variable "fsx_windows_free_storage_capacity_threshold_critical" {
  description = "FSX for Windows free storage capacity critical threshold in gigabytes"
  default     = 10
}

variable "fsx_windows_throughput_enabled" {
  description = "Flag to enable FSX for Windows throughput monitor"
  type        = string
  default     = "true"
}

variable "fsx_windows_throughput_extra_tags" {
  description = "Extra tags for FSX for Windows throughput monitor"
  type        = list(string)
  default     = []
}

variable "fsx_windows_throughput_message" {
  description = "Custom message for FSX for Windows throughput monitor"
  type        = string
  default     = ""
}

variable "fsx_windows_throughput_time_aggregator" {
  description = "Monitor aggregator for FSX for Windows throughput [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "fsx_windows_throughput_timeframe" {
  description = "Monitor timeframe for FSX for Windows throughput [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "fsx_windows_throughput_threshold_critical" {
  default     = 4
  description = "FSX for Windows throughput critical threshold in megabytes"
}

variable "fsx_windows_throughput_threshold_warning" {
  default     = 2
  description = "FSX for Windows throughput warning threshold in megabytes"
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}

