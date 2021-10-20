# Global Terraform
variable "environment" {
  description = "Infrastructure Environment"
  type        = string
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_group_delay" {
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

variable "elasticache_max_connection_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

# Elasticache specific

variable "eviction_enabled" {
  description = "Flag to enable Elasticache eviction monitor"
  type        = string
  default     = "true"
}

variable "eviction_extra_tags" {
  description = "Extra tags for Elasticache eviction monitor"
  type        = list(string)
  default     = []
}

variable "eviction_message" {
  description = "Custom message for Elasticache eviction monitor"
  type        = string
  default     = ""
}

variable "eviction_timeframe" {
  description = "Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "eviction_threshold_warning" {
  description = "Elasticache free memory warning threshold in percentage"
  type        = string
  default     = 0
}

variable "eviction_threshold_critical" {
  description = "Elasticache free memory critical threshold in percentage"
  type        = string
  default     = 30
}

variable "max_connection_enabled" {
  description = "Flag to enable Elasticache max connection monitor"
  type        = string
  default     = "true"
}

variable "max_connection_extra_tags" {
  description = "Extra tags for Elasticache max connection monitor"
  type        = list(string)
  default     = []
}

variable "max_connection_message" {
  description = "Custom message for Elasticache max connection monitor"
  type        = string
  default     = ""
}

variable "max_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache max connection [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "max_connection_timeframe" {
  description = "Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "no_connection_enabled" {
  description = "Flag to enable Elasticache no connection monitor"
  type        = string
  default     = "true"
}

variable "no_connection_extra_tags" {
  description = "Extra tags for Elasticache no connection monitor"
  type        = list(string)
  default     = []
}

variable "no_connection_message" {
  description = "Custom message for Elasticache no connection monitor"
  type        = string
  default     = ""
}

variable "no_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache no connection [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "no_connection_timeframe" {
  description = "Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "swap_enabled" {
  description = "Flag to enable Elasticache swap monitor"
  type        = string
  default     = "true"
}

variable "swap_extra_tags" {
  description = "Extra tags for Elasticache swap monitor"
  type        = list(string)
  default     = []
}

variable "swap_message" {
  description = "Custom message for Elasticache swap monitor"
  type        = string
  default     = ""
}

variable "swap_time_aggregator" {
  description = "Monitor aggregator for Elasticache memcached swap [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "swap_timeframe" {
  description = "Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "swap_threshold_warning" {
  description = "Elasticache swap warning threshold in bytes"
  type        = string
  default     = 0
}

variable "swap_threshold_critical" {
  description = "Elasticache swap critical threshold in bytes"
  type        = string
  default     = 50000000
}

variable "free_memory_enabled" {
  description = "Flag to enable Elasticache free memory monitor"
  type        = string
  default     = "true"
}

variable "free_memory_extra_tags" {
  description = "Extra tags for Elasticache free memory monitor"
  type        = list(string)
  default     = []
}

variable "free_memory_message" {
  description = "Custom message for Elasticache free memory monitor"
  type        = string
  default     = ""
}

variable "free_memory_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "free_memory_timeframe" {
  description = "Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "free_memory_threshold_warning" {
  description = "Elasticache free memory warning threshold in percentage"
  type        = string
  default     = -50
}

variable "free_memory_threshold_critical" {
  description = "Elasticache free memory critical threshold in percentage"
  type        = string
  default     = -70
}

variable "eviction_growing_enabled" {
  description = "Flag to enable Elasticache eviction growing monitor"
  type        = string
  default     = "true"
}

variable "eviction_growing_extra_tags" {
  description = "Extra tags for Elasticache eviction growing monitor"
  type        = list(string)
  default     = []
}

variable "eviction_growing_message" {
  description = "Custom message for Elasticache eviction growing monitor"
  type        = string
  default     = ""
}

variable "eviction_growing_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "eviction_growing_timeframe" {
  description = "Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "eviction_growing_threshold_warning" {
  description = "Elasticache eviction growing warning threshold in percentage"
  type        = string
  default     = 10
}

variable "eviction_growing_threshold_critical" {
  description = "Elasticache eviction growing critical threshold in percentage"
  type        = string
  default     = 30
}

