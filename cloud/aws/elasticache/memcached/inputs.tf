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

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

variable "memcached_cpu_high_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 30
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

# Memcached specific

variable "get_hits_enabled" {
  description = "Flag to enable Elasticache memcached get hits monitor"
  type        = string
  default     = "true"
}

variable "get_hits_extra_tags" {
  description = "Extra tags for Elasticache memcached get hits monitor"
  type        = list(string)
  default     = []
}

variable "get_hits_message" {
  description = "Custom message for Elasticache memcached get hits monitor"
  type        = string
  default     = ""
}

variable "get_hits_time_aggregator" {
  description = "Monitor aggregator for Elasticache memcached get hits [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "get_hits_timeframe" {
  description = "Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "get_hits_threshold_warning" {
  description = "Elasticache memcached get hits warning threshold in percentage"
  type        = string
  default     = 80
}

variable "get_hits_threshold_critical" {
  description = "Elasticache memcached get hits critical threshold in percentage"
  type        = string
  default     = 60
}

variable "cpu_high_enabled" {
  description = "Flag to enable Elasticache memcached cpu high monitor"
  type        = string
  default     = "true"
}

variable "cpu_high_extra_tags" {
  description = "Extra tags for Elasticache memcached cpu high monitor"
  type        = list(string)
  default     = []
}

variable "cpu_high_message" {
  description = "Custom message for Elasticache memcached cpu high monitor"
  type        = string
  default     = ""
}

variable "cpu_high_time_aggregator" {
  description = "Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "cpu_high_timeframe" {
  description = "Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "cpu_high_threshold_warning" {
  description = "Elasticache memcached cpu high warning threshold in percentage"
  type        = string
  default     = 75
}

variable "cpu_high_threshold_critical" {
  description = "Elasticache memcached cpu high critical threshold in percentage"
  type        = string
  default     = 90
}

