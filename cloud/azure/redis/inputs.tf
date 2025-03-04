# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:redis"]
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
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

variable "status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
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

# Azure Redis specific variables

variable "status_enabled" {
  description = "Flag to enable Redis status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Redis status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for Redis status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Redis status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "evictedkeys_limit_enabled" {
  description = "Flag to enable Redis evicted keys monitor"
  type        = string
  default     = "true"
}

variable "evictedkeys_limit_extra_tags" {
  description = "Extra tags for Redis evicted keys monitor"
  type        = list(string)
  default     = []
}

variable "evictedkeys_limit_message" {
  description = "Custom message for Redis evicted keys monitor"
  type        = string
  default     = ""
}

variable "evictedkeys_limit_time_aggregator" {
  description = "Monitor aggregator for Redis evicted keys [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "evictedkeys_limit_timeframe" {
  description = "Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
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

variable "percent_processor_time_enabled" {
  description = "Flag to enable Redis processor monitor"
  type        = string
  default     = "true"
}

variable "percent_processor_time_extra_tags" {
  description = "Extra tags for Redis processor monitor"
  type        = list(string)
  default     = []
}

variable "percent_processor_time_message" {
  description = "Custom message for Redis processor monitor"
  type        = string
  default     = ""
}

variable "percent_processor_time_time_aggregator" {
  description = "Monitor aggregator for Redis processor [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "percent_processor_time_timeframe" {
  description = "Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
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

variable "server_load_rate_enabled" {
  description = "Flag to enable Redis server load monitor"
  type        = string
  default     = "true"
}

variable "server_load_rate_extra_tags" {
  description = "Extra tags for Redis server load monitor"
  type        = list(string)
  default     = []
}

variable "server_load_rate_message" {
  description = "Custom message for Redis server load monitor"
  type        = string
  default     = ""
}

variable "server_load_rate_time_aggregator" {
  description = "Monitor aggregator for Redis server load [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "server_load_rate_timeframe" {
  description = "Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
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

