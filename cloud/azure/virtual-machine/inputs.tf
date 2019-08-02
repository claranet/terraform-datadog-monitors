# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = string
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
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

# Azure Virtual Machine specific variables

variable "status_enabled" {
  description = "Flag to enable Virtual Machine status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Virtual Machine status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for Virtual Machine status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Virtual Machine status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Virtual Machine status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "cpu_usage_enabled" {
  description = "Flag to enable Virtual Machine status monitor"
  type        = string
  default     = "true"
}

variable "cpu_usage_extra_tags" {
  description = "Extra tags for Virtual Machine status monitor"
  type        = list(string)
  default     = []
}

variable "cpu_usage_message" {
  description = "Custom message for Virtual Machine CPU monitor"
  type        = string
  default     = ""
}

variable "cpu_usage_time_aggregator" {
  description = "Monitor aggregator for Virtual Machine CPU [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_usage_timeframe" {
  description = "Monitor timeframe for Virtual Machine CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cpu_usage_threshold_warning" {
  description = "Virtual Machine CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "cpu_usage_threshold_critical" {
  description = "Virtual Machine CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "cpu_remaining_rate_enabled" {
  description = "Flag to enable Virtual Machine CPU remaining monitor"
  type        = string
  default     = "true"
}

variable "cpu_remaining_rate_extra_tags" {
  description = "Extra tags for Virtual Machine CPU remaining monitor"
  type        = list(string)
  default     = []
}

variable "cpu_remaining_rate_message" {
  description = "Custom message for Virtual Machine CPU remaining monitor"
  type        = string
  default     = ""
}

variable "cpu_remaining_rate_time_aggregator" {
  description = "Monitor aggregator for Virtual Machine CPU remaining [available values: min, max, sum or avg]"
  type        = string
  default     = "min"
}

variable "cpu_remaining_rate_timeframe" {
  description = "Monitor timeframe for Virtual Machine CPU remaining [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "cpu_remaining_rate_threshold_warning" {
  description = "Virtual Machine CPU rate limit (warning threshold)"
  default     = 30
}

variable "cpu_remaining_rate_threshold_critical" {
  description = "Virtual Machine CPU rate limit (critical threshold)"
  default     = 15
}

variable "ram_reserved_enabled" {
  description = "Flag to enable Virtual Machine RAM reserved monitor"
  type        = string
  default     = "true"
}

variable "ram_reserved_message" {
  description = "Custom message for Virtual Machine RAM reserved monitor"
  type        = string
  default     = ""
}

variable "ram_reserved_extra_tags" {
  description = "Extra tags for Virtual Machine RAM reserved monitor"
  type        = list(string)
  default     = []
}

variable "ram_reserved_time_aggregator" {
  description = "Monitor aggregator for Virtual Machine RAM reserved [available values: min, max, sum or avg]"
  type        = string
  default     = "min"
}

variable "ram_reserved_timeframe" {
  description = "Monitor timeframe for Virtual Machine RAM reserved [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "ram_reserved_threshold_warning" {
  description = "Virtual Machine RAM reserved limit (warning threshold)"
  default     = 90
}

variable "ram_reserved_threshold_critical" {
  description = "Virtual Machine RAM reserved limit (critical threshold)"
  default     = 95
}

variable "filesystem_free_disk_space_low_enabled" {
  description = "Flag to enable Virtual Machine status monitor"
  type        = string
  default     = "true"
}

variable "filesystem_free_disk_space_low_time_aggregator" {
  description = "Monitor aggregator for Virtual Machine free disk space [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "filesystem_free_disk_space_low_timeframe" {
  description = "Monitor timeframe for Virtual Machine free disk space too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "filesystem_free_disk_space_low_threshold_critical" {
  description = "Virtual Machine free disk space in percent (critical threshold)"
  default     = "5"
}

variable "filesystem_free_disk_space_low_threshold_warning" {
  description = "Virtual Machine free disk space in percent (warning threshold)"
  default     = "10"
}

variable "filesystem_free_disk_space_low_extra_tags" {
  description = "Extra tags for Virtual Machine free disk space monitor"
  type        = list(string)
  default     = []
}

variable "filesystem_free_disk_space_low_message" {
  description = "Custom message for Virtual Machine CPU free disk space monitor"
  type        = string
  default     = ""
}
