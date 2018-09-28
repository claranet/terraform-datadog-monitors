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

# redis specific
variable "cache_hits_silenced" {
  description = "Groups to mute for Elasticache redis cache hits monitor"
  type        = "map"
  default     = {}
}

variable "cache_hits_enabled" {
  description = "Flag to enable Elasticache redis cache hits monitor"
  type        = "string"
  default     = "true"
}

variable "cache_hits_extra_tags" {
  description = "Extra tags for Elasticache redis cache hits monitor"
  type        = "list"
  default     = []
}

variable "cache_hits_message" {
  description = "Custom message for Elasticache redis cache hits monitor"
  type        = "string"
  default     = ""
}

variable "cache_hits_time_aggregator" {
  description = "Monitor aggregator for Elasticache redis cache hits [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "cache_hits_timeframe" {
  description = "Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "cache_hits_threshold_warning" {
  description = "Elasticache redis cache hits warning threshold in percentage"
  type        = "string"
  default     = 80
}

variable "cache_hits_threshold_critical" {
  description = "Elasticache redis cache hits critical threshold in percentage"
  type        = "string"
  default     = 60
}

variable "cpu_high_silenced" {
  description = "Groups to mute for Elasticache redis cpu high monitor"
  type        = "map"
  default     = {}
}

variable "cpu_high_enabled" {
  description = "Flag to enable Elasticache redis cpu high monitor"
  type        = "string"
  default     = "true"
}

variable "cpu_high_extra_tags" {
  description = "Extra tags for Elasticache redis cpu high monitor"
  type        = "list"
  default     = []
}

variable "cpu_high_message" {
  description = "Custom message for Elasticache redis cpu high monitor"
  type        = "string"
  default     = ""
}

variable "cpu_high_time_aggregator" {
  description = "Monitor aggregator for Elasticache redis cpu high [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_high_timeframe" {
  description = "Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_15m"
}

variable "cpu_high_threshold_warning" {
  description = "Elasticache redis cpu high warning threshold in percentage"
  type        = "string"
  default     = 75
}

variable "cpu_high_threshold_critical" {
  description = "Elasticache redis cpu high critical threshold in percentage"
  type        = "string"
  default     = 90
}

variable "replication_lag_silenced" {
  description = "Groups to mute for Elasticache redis replication lag monitor"
  type        = "map"
  default     = {}
}

variable "replication_lag_enabled" {
  description = "Flag to enable Elasticache redis replication lag monitor"
  type        = "string"
  default     = "true"
}

variable "replication_lag_extra_tags" {
  description = "Extra tags for Elasticache redis replication lag monitor"
  type        = "list"
  default     = []
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
  type        = "string"
  default     = "last_10m"
}

variable "replication_lag_threshold_warning" {
  description = "Elasticache redis replication lag warning threshold in seconds"
  type        = "string"
  default     = 90
}

variable "replication_lag_threshold_critical" {
  description = "Elasticache redis replication lag critical threshold in seconds"
  type        = "string"
  default     = 180
}

variable "commands_silenced" {
  description = "Groups to mute for Elasticache redis commands monitor"
  type        = "map"
  default     = {}
}

variable "commands_enabled" {
  description = "Flag to enable Elasticache redis commands monitor"
  type        = "string"
  default     = "true"
}

variable "commands_extra_tags" {
  description = "Extra tags for Elasticache redis commands monitor"
  type        = "list"
  default     = []
}

variable "commands_message" {
  description = "Custom message for Elasticache redis commands monitor"
  type        = "string"
  default     = ""
}

variable "commands_timeframe" {
  description = "Monitor timeframe for Elasticache redis commands [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}
