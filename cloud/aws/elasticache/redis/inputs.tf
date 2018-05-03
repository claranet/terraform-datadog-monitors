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
variable "cache_miss_silenced" {
  description = "Groups to mute for Elasticache Redis cache miss monitor"
  type        = "map"
  default     = {}
}

variable "cache_miss_message" {
  description = "Custom message for Elasticache Redis cache miss monitor"
  type        = "string"
  default     = ""
}

variable "cache_miss_aggregator" {
  description = "Monitor aggregator for Elasticache Redis cache miss [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "cache_miss_timeframe" {
  description = "Monitor timeframe for Elasticache Redis cache miss [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_15m"
}

variable "cache_miss_threshold_warning" {
  description = "Elasticache Redis cache miss warning threshold in percentage"
  default     = 80
}

variable "cache_miss_threshold_critical" {
  description = "Elasticache Redis cache miss critical threshold in percentage"
  default     = 95
}
