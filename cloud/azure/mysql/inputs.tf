# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = string
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
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

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure Databases for MySQL Servers specific variables

variable "cpu_usage_enabled" {
  description = "Flag to enable Mysql status monitor"
  type        = string
  default     = "true"
}

variable "cpu_usage_extra_tags" {
  description = "Extra tags for Mysql status monitor"
  type        = list(string)
  default     = []
}

variable "cpu_usage_message" {
  description = "Custom message for Mysql CPU monitor"
  type        = string
  default     = ""
}

variable "cpu_usage_time_aggregator" {
  description = "Monitor aggregator for Mysql CPU [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_usage_timeframe" {
  description = "Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cpu_usage_threshold_warning" {
  description = "Mysql CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "cpu_usage_threshold_critical" {
  description = "Mysql CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "free_storage_enabled" {
  description = "Flag to enable Mysql status monitor"
  type        = string
  default     = "true"
}

variable "free_storage_extra_tags" {
  description = "Extra tags for Mysql status monitor"
  type        = list(string)
  default     = []
}

variable "free_storage_message" {
  description = "Custom message for Mysql Free Storage monitor"
  type        = string
  default     = ""
}

variable "free_storage_time_aggregator" {
  description = "Monitor aggregator for Mysql Free Storage [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "free_storage_timeframe" {
  description = "Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "free_storage_threshold_warning" {
  description = "Mysql Free Storage remaining in percent (warning threshold)"
  default     = "20"
}

variable "free_storage_threshold_critical" {
  description = "Mysql Free Storage remaining in percent (critical threshold)"
  default     = "10"
}

variable "io_consumption_enabled" {
  description = "Flag to enable Mysql status monitor"
  type        = string
  default     = "true"
}

variable "io_consumption_extra_tags" {
  description = "Extra tags for Mysql status monitor"
  type        = list(string)
  default     = []
}

variable "io_consumption_message" {
  description = "Custom message for Mysql IO consumption monitor"
  type        = string
  default     = ""
}

variable "io_consumption_time_aggregator" {
  description = "Monitor aggregator for Mysql IO consumption [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "io_consumption_timeframe" {
  description = "Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "io_consumption_threshold_warning" {
  description = "Mysql IO consumption in percent (warning threshold)"
  default     = "80"
}

variable "io_consumption_threshold_critical" {
  description = "Mysql IO consumption in percent (critical threshold)"
  default     = "90"
}

variable "memory_usage_enabled" {
  description = "Flag to enable Mysql status monitor"
  type        = string
  default     = "true"
}

variable "memory_usage_extra_tags" {
  description = "Extra tags for Mysql status monitor"
  type        = list(string)
  default     = []
}

variable "memory_usage_message" {
  description = "Custom message for Mysql memory monitor"
  type        = string
  default     = ""
}

variable "memory_usage_time_aggregator" {
  description = "Monitor aggregator for Mysql memory [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "memory_usage_timeframe" {
  description = "Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "memory_usage_threshold_warning" {
  description = "Mysql memory usage in percent (warning threshold)"
  default     = "80"
}

variable "memory_usage_threshold_critical" {
  description = "Mysql memory usage in percent (critical threshold)"
  default     = "90"
}

