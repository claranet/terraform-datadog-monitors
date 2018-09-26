# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

# Azure Databases for Postgresql Servers specific variables
variable "cpu_usage_silenced" {
  description = "Groups to mute for Postgresql CPU monitor"
  type        = "map"
  default     = {}
}

variable "cpu_usage_message" {
  description = "Custom message for Postgresql CPU monitor"
  type        = "string"
  default     = ""
}

variable "cpu_usage_time_aggregator" {
  description = "Monitor aggregator for Postgresql CPU [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_usage_timeframe" {
  description = "Monitor timeframe for Postgresql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "cpu_usage_threshold_warning" {
  description = "Postgresql CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "cpu_usage_threshold_critical" {
  description = "Postgresql CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "no_connection_silenced" {
  description = "Groups to mute for Postgresql no connection monitor"
  type        = "map"
  default     = {}
}

variable "no_connection_message" {
  description = "Custom message for Postgresql no connection monitor"
  type        = "string"
  default     = ""
}

variable "no_connection_time_aggregator" {
  description = "Monitor aggregator for Postgresql no connection [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "no_connection_timeframe" {
  description = "Monitor timeframe for Postgresql no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "free_storage_silenced" {
  description = "Groups to mute for Postgresql Free Storage monitor"
  type        = "map"
  default     = {}
}

variable "free_storage_message" {
  description = "Custom message for Postgresql Free Storage monitor"
  type        = "string"
  default     = ""
}

variable "free_storage_time_aggregator" {
  description = "Monitor aggregator for Postgresql Free Storage [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "free_storage_timeframe" {
  description = "Monitor timeframe for Postgresql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "free_storage_threshold_warning" {
  description = "Postgresql Free Storage remaining in percent (warning threshold)"
  default     = "20"
}

variable "free_storage_threshold_critical" {
  description = "Postgresql Free Storage remaining in percent (critical threshold)"
  default     = "10"
}

variable "io_consumption_silenced" {
  description = "Groups to mute for Postgresql IO consumption monitor"
  type        = "map"
  default     = {}
}

variable "io_consumption_message" {
  description = "Custom message for Postgresql IO consumption monitor"
  type        = "string"
  default     = ""
}

variable "io_consumption_time_aggregator" {
  description = "Monitor aggregator for Postgresql IO consumption [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "io_consumption_timeframe" {
  description = "Monitor timeframe for Postgresql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "io_consumption_threshold_warning" {
  description = "Postgresql IO consumption in percent (warning threshold)"
  default     = "80"
}

variable "io_consumption_threshold_critical" {
  description = "Postgresql IO consumption in percent (critical threshold)"
  default     = "90"
}

variable "memory_usage_silenced" {
  description = "Groups to mute for Postgresql memory monitor"
  type        = "map"
  default     = {}
}

variable "memory_usage_message" {
  description = "Custom message for Postgresql memory monitor"
  type        = "string"
  default     = ""
}

variable "memory_usage_time_aggregator" {
  description = "Monitor aggregator for Postgresql memory [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "memory_usage_timeframe" {
  description = "Monitor timeframe for Postgresql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "memory_usage_threshold_warning" {
  description = "Postgresql memory usage in percent (warning threshold)"
  default     = "80"
}

variable "memory_usage_threshold_critical" {
  description = "Postgresql memory usage in percent (critical threshold)"
  default     = "90"
}

variable "compute_consumption_silenced" {
  description = "Groups to mute for Postgresql compute consumption monitor"
  type        = "map"
  default     = {}
}

variable "compute_consumption_message" {
  description = "Custom message for Postgresql compute consumption monitor"
  type        = "string"
  default     = ""
}

variable "compute_consumption_time_aggregator" {
  description = "Monitor aggregator for Postgresql compute consumption [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "compute_consumption_timeframe" {
  description = "Monitor timeframe for Postgresql compute consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "compute_consumption_threshold_warning" {
  description = "Postgresql compute consumption in percent (warning threshold)"
  default     = "80"
}

variable "compute_consumption_threshold_critical" {
  description = "Postgresql compute consumption in percent (critical threshold)"
  default     = "90"
}
