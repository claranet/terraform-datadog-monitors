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

# Azure Redis specific variables
variable "status_silenced" {
  description = "Groups to mute for Redis status monitor"
  type        = "map"
  default     = {}
}

variable "status_message" {
  description = "Custom message for Redis status monitor"
  type        = "string"
  default     = ""
}

variable "status_timeframe" {
  description = "Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
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

variable "percent_processor_time_silenced" {
  description = "Groups to mute for Redis processor monitor"
  type        = "map"
  default     = {}
}

variable "percent_processor_time_message" {
  description = "Custom message for Redis processor monitor"
  type        = "string"
  default     = ""
}

variable "percent_processor_time_timeframe" {
  description = "Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "percent_processor_time_threshold_critical" {
  description = "Processor time percent (critical threshold)"
  default     = 80
}

variable "percent_processor_time_threshold_warning" {
  description = "Processor time percent (warning threshold)"
  default     = 60
}

variable "server_load_rate_silenced" {
  description = "Groups to mute for Redis server load monitor"
  type        = "map"
  default     = {}
}

variable "server_load_rate_message" {
  description = "Custom message for Redis server load monitor"
  type        = "string"
  default     = ""
}

variable "server_load_rate_timeframe" {
  description = "Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "server_load_rate_threshold_critical" {
  description = "Server CPU load rate (critical threshold)"
  default     = 90
}

variable "server_load_rate_threshold_warning" {
  description = "Server CPU load rate (warning threshold)"
  default     = 70
}
