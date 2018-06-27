# Global Terraform
variable "environment" {
  description = "Infrastructure Environment"
  type        = "string"
}

# Global DataDog
variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

# redis specific
variable "cache_hits_silenced" {
  description = "Groups to mute for Elasticache redis cache hits monitor"
  type        = "map"
  default     = {}
}

variable "cache_hits_message" {
  description = "Custom message for Elasticache redis cache hits monitor"
  type        = "string"
  default     = ""
}

variable "cache_hits_timeframe" {
  description = "Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "cache_hits_threshold_warning" {
  description = "Elasticache redis cache hits warning threshold in percentage"
  default     = 20
}

variable "cache_hits_threshold_critical" {
  description = "Elasticache redis cache hits critical threshold in percentage"
  default     = 10
}

variable "cpu_high_silenced" {
  description = "Groups to mute for Elasticache redis cpu high monitor"
  type        = "map"
  default     = {}
}

variable "cpu_high_message" {
  description = "Custom message for Elasticache redis cpu high monitor"
  type        = "string"
  default     = ""
}

variable "cpu_high_time_aggregator" {
  description = "Monitor aggregator for Elasticache redis cpu high [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "cpu_high_timeframe" {
  description = "Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "cpu_high_threshold_warning" {
  description = "Elasticache redis cpu high warning threshold in percentage"
  default     = 75
}

variable "cpu_high_threshold_critical" {
  description = "Elasticache redis cpu high critical threshold in percentage"
  default     = 90
}

variable "replication_lag_silenced" {
  description = "Groups to mute for Elasticache redis replication lag monitor"
  type        = "map"
  default     = {}
}

variable "replication_lag_message" {
  description = "Custom message for Elasticache redis replication lag monitor"
  type        = "string"
  default     = ""
}

variable "replication_lag_time_aggregator" {
  description = "Monitor aggregator for Elasticache redis replication lag [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "replication_lag_timeframe" {
  description = "Monitor timeframe for Elasticache redis replication lag [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "replication_lag_threshold_warning" {
  description = "Elasticache redis replication lag warning threshold in seconds"
  default     = 0
}

variable "replication_lag_threshold_critical" {
  description = "Elasticache redis replication lag critical threshold in seconds"
  default     = 1
}

variable "commands_silenced" {
  description = "Groups to mute for Elasticache redis commands monitor"
  type        = "map"
  default     = {}
}

variable "commands_message" {
  description = "Custom message for Elasticache redis commands monitor"
  type        = "string"
  default     = ""
}

variable "commands_timeframe" {
  description = "Monitor timeframe for Elasticache redis commands [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

# Elasticache specific
variable "eviction_silenced" {
  description = "Groups to mute for Elasticache eviction monitor"
  type        = "map"
  default     = {}
}

variable "eviction_message" {
  description = "Custom message for Elasticache eviction monitor"
  type        = "string"
  default     = ""
}

variable "eviction_time_aggregator" {
  description = "Monitor aggregator for Elasticache eviction [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "eviction_timeframe" {
  description = "Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "max_connection_silenced" {
  description = "Groups to mute for Elasticache max connection monitor"
  type        = "map"
  default     = {}
}

variable "max_connection_message" {
  description = "Custom message for Elasticache max connection monitor"
  type        = "string"
  default     = ""
}

variable "max_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache max connection [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "max_connection_timeframe" {
  description = "Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "no_connection_silenced" {
  description = "Groups to mute for Elasticache no connection monitor"
  type        = "map"
  default     = {}
}

variable "no_connection_message" {
  description = "Custom message for Elasticache no connection monitor"
  type        = "string"
  default     = ""
}

variable "no_connection_time_aggregator" {
  description = "Monitor aggregator for Elasticache no connection [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "no_connection_timeframe" {
  description = "Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "swap_silenced" {
  description = "Groups to mute for Elasticache swap monitor"
  type        = "map"
  default     = {}
}

variable "swap_message" {
  description = "Custom message for Elasticache swap monitor"
  type        = "string"
  default     = ""
}

variable "swap_time_aggregator" {
  description = "Monitor aggregator for Elasticache memcached swap [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "swap_timeframe" {
  description = "Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "swap_threshold_warning" {
  description = "Elasticache swap warning threshold in percentage"
  default     = 0
}

variable "swap_threshold_critical" {
  description = "Elasticache swap critical threshold in percentage"
  default     = 50000000
}

variable "free_memory_silenced" {
  description = "Groups to mute for Elasticache free memory monitor"
  type        = "map"
  default     = {}
}

variable "free_memory_message" {
  description = "Custom message for Elasticache free memory monitor"
  type        = "string"
  default     = ""
}

variable "free_memory_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "free_memory_timeframe" {
  description = "Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "free_memory_threshold_warning" {
  description = "Elasticache free memory warning threshold in percentage"
  default     = -50
}

variable "free_memory_threshold_critical" {
  description = "Elasticache free memory critical threshold in percentage"
  default     = -70
}

variable "eviction_growing_silenced" {
  description = "Groups to mute for Elasticache eviction growing monitor"
  type        = "map"
  default     = {}
}

variable "eviction_growing_message" {
  description = "Custom message for Elasticache eviction growing monitor"
  type        = "string"
  default     = ""
}

variable "eviction_growing_condition_timeframe" {
  description = "Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "eviction_growing_timeframe" {
  description = "Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}

variable "eviction_growing_threshold_warning" {
  description = "Elasticache eviction growing warning threshold in percentage"
  default     = 10
}

variable "eviction_growing_threshold_critical" {
  description = "Elasticache eviction growing critical threshold in percentage"
  default     = 30
}
