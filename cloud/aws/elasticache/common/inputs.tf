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

variable "eviction_aggregator" {
  description = "Monitor aggregator for Elasticache eviction [available values: min, max, sum or avg]"
  type        = "string"
  default     = "min"
}

variable "eviction_timeframe" {
  description = "Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  default     = "last_5m"
}
