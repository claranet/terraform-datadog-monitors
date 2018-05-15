# Global Terraform
variable "environment" {
  description = "Architecture Environment"
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

# Redis specific
variable "redis_size" {
  description = "Size of the Elasticache Redis instance"
  type        = "string"
}

variable "cache_hit_silenced" {
  description = "Groups to mute for Elasticache Redis cache miss monitor"
  type        = "map"
  default     = {}
}

variable "cache_hit_message" {
  description = "Custom message for Elasticache Redis cache miss monitor"
  type        = "string"
  default     = ""
}

variable "cache_hit_aggregator" {
  description = "Monitor aggregator for Elasticache Redis cache miss [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "cache_hit_timeframe" {
  description = "Monitor timeframe for Elasticache Redis cache miss [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "cache_hit_threshold_warning" {
  description = "Elasticache Redis cache miss warning threshold in percentage"
  default     = 20
}

variable "cache_hit_threshold_critical" {
  description = "Elasticache Redis cache miss critical threshold in percentage"
  default     = 10
}

variable "cpu_high_silenced" {
  description = "Groups to mute for Elasticache Redis cpu high monitor"
  type        = "map"
  default     = {}
}

variable "cpu_high_message" {
  description = "Custom message for Elasticache Redis cpu high monitor"
  type        = "string"
  default     = ""
}

variable "cpu_high_aggregator" {
  description = "Monitor aggregator for Elasticache Redis cpu high [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "cpu_high_timeframe" {
  description = "Monitor timeframe for Elasticache Redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "cpu_high_threshold_warning" {
  description = "Elasticache Redis cpu high warning threshold in percentage"
  default     = 75
}

variable "cpu_high_threshold_critical" {
  description = "Elasticache Redis cpu high critical threshold in percentage"
  default     = 90
}

variable "swap_silenced" {
  description = "Groups to mute for Elasticache Redis swap monitor"
  type        = "map"
  default     = {}
}

variable "swap_message" {
  description = "Custom message for Elasticache Redis swap monitor"
  type        = "string"
  default     = ""
}

variable "swap_aggregator" {
  description = "Monitor aggregator for Elasticache Redis swap [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "swap_timeframe" {
  description = "Monitor timeframe for Elasticache Redis swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}
