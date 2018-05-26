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

variable "filter_tags" {
  description = "Tags used for filtering"
}

variable "resource" {
  description = "Type of Elasticache used"
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
