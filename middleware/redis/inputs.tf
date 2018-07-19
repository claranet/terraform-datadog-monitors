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

# Redis specific variables
variable "redis_silenced" {
  description = "Groups to mute for Redis monitors"
  type        = "map"
  default     = {}
}

variable "evictedkeys_limit_silenced" {
  description = "Groups to mute for Redis evicted keys monitor"
  type        = "map"
  default     = {}
}

variable "evictedkeys_limit_message" {
  description = "Custom message for Redis evicted keys monitor"
  type        = "string"
  default     = ""
}

variable "evictedkeys_limit_time_aggregator" {
  description = "Monitor aggregator for Redis evicted keys [available values: min, max or avg]"
  type        = "string"
  default     = "avg"
}

variable "evictedkeys_limit_timeframe" {
  description = "Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "evictedkeys_limit_threshold_warning" {
  description = "Evicted keys limit (warning threshold)"
  default     = 0
}

variable "evictedkeys_limit_threshold_critical" {
  description = "Evicted keys limit (critical threshold)"
  default     = 100
}

variable "expirations_silenced" {
  description = "Groups to mute for Redis keys expirations monitor"
  type        = "map"
  default     = {}
}

variable "expirations_limit_message" {
  description = "Custom message for Redis keys expirations monitor"
  type        = "string"
  default     = ""
}

variable "expirations_limit_time_aggregator" {
  description = "Monitor aggregator for Redis keys expirations [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "expirations_limit_timeframe" {
  description = "Monitor timeframe for Redis keys expirations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "expirations_limit_threshold_critical" {
  description = "Expirations percent (critical threshold)"
  default     = 80
}

variable "expirations_limit_threshold_warning" {
  description = "Expirations percent (warning threshold)"
  default     = 60
}

variable "blocked_clients_silenced" {
  description = "Groups to mute for Redis Blocked clients monitor"
  type        = "map"
  default     = {}
}

variable "blocked_clients_message" {
  description = "Custom message for Redis Blocked clients monitor"
  type        = "string"
  default     = ""
}

variable "blocked_clients_time_aggregator" {
  description = "Monitor aggregator for Redis Blocked clients [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "blocked_clients_timeframe" {
  description = "Monitor timeframe for Redis Blocked clients [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "blocked_clients_threshold_critical" {
  description = "Blocked clients rate (critical threshold)"
  default     = 90
}

variable "blocked_clients_threshold_warning" {
  description = "Blocked clients rate (warning threshold)"
  default     = 70
}

variable "keyspace_silenced" {
  description = "Groups to mute for Redis keyspace monitor"
  type        = "map"
  default     = {}
}

variable "keyspace_message" {
  description = "Custom message for Redis keyspace monitor"
  type        = "string"
  default     = ""
}

variable "keyspace_time_aggregator" {
  description = "Monitor aggregator for Redis keyspace [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "keyspace_timeframe" {
  description = "Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "keyspace_threshold_critical" {
  description = "Keyspace changement (critical threshold)"
  default     = 90
}

variable "keyspace_threshold_warning" {
  description = "Keyspace changement (warning threshold)"
  default     = 70
}
