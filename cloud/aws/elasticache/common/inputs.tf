# Global Terraform
variable "environment" {
  description = "Infrastructure Environment"
  type        = "string"
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

# Elasticache specific
variable "eviction_silenced" {
  description = "Groups to mute for Elasticache eviction monitor"
  type        = "map"
}

variable "eviction_message" {
  description = "Custom message for Elasticache eviction monitor"
  type        = "string"
}

variable "eviction_time_aggregator" {
  description = "Monitor aggregator for Elasticache eviction [available values: min, max or avg]"
  type        = "string"
}

variable "eviction_timeframe" {
  description = "Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "max_connection_silenced" {
  description = "Groups to mute for Elasticache max connection monitor"
  type        = "map"
}

variable "max_connection_message" {
  description = "Custom message for Elasticache max connection monitor"
  type        = "string"
}

variable "max_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache max connection [available values: min, max or avg]"
  type        = "string"
}

variable "max_connection_timeframe" {
  description = "Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "no_connection_silenced" {
  description = "Groups to mute for Elasticache no connection monitor"
  type        = "map"
}

variable "no_connection_message" {
  description = "Custom message for Elasticache no connection monitor"
  type        = "string"
}

variable "no_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache no connection [available values: min, max or avg]"
  type        = "string"
}

variable "no_connection_timeframe" {
  description = "Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "swap_silenced" {
  description = "Groups to mute for Elasticache swap monitor"
  type        = "map"
}

variable "swap_message" {
  description = "Custom message for Elasticache swap monitor"
  type        = "string"
}

variable "swap_time_aggregator" {
  description = "Monitor aggregator for Elasticache memcached swap [available values: min, max or avg]"
  type        = "string"
}

variable "swap_timeframe" {
  description = "Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "swap_threshold_warning" {
  description = "Elasticache swap warning threshold in percentage"
}

variable "swap_threshold_critical" {
  description = "Elasticache swap critical threshold in percentage"
}

variable "free_memory_silenced" {
  description = "Groups to mute for Elasticache free memory monitor"
  type        = "map"
}

variable "free_memory_message" {
  description = "Custom message for Elasticache free memory monitor"
  type        = "string"
}

variable "free_memory_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "free_memory_timeframe" {
  description = "Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "free_memory_threshold_warning" {
  description = "Elasticache free memory warning threshold in percentage"
}

variable "free_memory_threshold_critical" {
  description = "Elasticache free memory critical threshold in percentage"
}

variable "eviction_growing_silenced" {
  description = "Groups to mute for Elasticache eviction growing monitor"
  type        = "map"
}

variable "eviction_growing_message" {
  description = "Custom message for Elasticache eviction growing monitor"
  type        = "string"
}

variable "eviction_growing_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "eviction_growing_timeframe" {
  description = "Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
}

variable "eviction_growing_threshold_warning" {
  description = "Elasticache eviction growing warning threshold in percentage"
}

variable "eviction_growing_threshold_critical" {
  description = "Elasticache eviction growing critical threshold in percentage"
}
