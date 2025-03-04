# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:azure-search"]
}

# Datadog variables
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

variable "message" {
  description = "Message sent when a monitor is triggered"
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

variable "azure_search_latency_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Azure Search specific variables

variable "latency_enabled" {
  description = "Flag to enable Azure Search latency monitor"
  type        = string
  default     = "true"
}

variable "latency_extra_tags" {
  description = "Extra tags for Azure Search latency monitor"
  type        = list(string)
  default     = []
}

variable "latency_message" {
  description = "Custom message for Azure Search latency monitor"
  type        = string
  default     = ""
}

variable "latency_time_aggregator" {
  description = "Monitor aggregator for Azure Search latency [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "latency_timeframe" {
  description = "Monitor timeframe for Azure Search latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "latency_threshold_critical" {
  default     = 4
  description = "Alerting threshold for Azure Search latency in seconds"
}

variable "latency_threshold_warning" {
  default     = 2
  description = "Warning threshold for Azure Search latency in seconds"
}

variable "throttled_queries_rate_enabled" {
  description = "Flag to enable Azure Search throttled queries rate monitor"
  type        = string
  default     = "true"
}

variable "throttled_queries_rate_extra_tags" {
  description = "Extra tags for Azure Search throttled queries rate monitor"
  type        = list(string)
  default     = []
}

variable "throttled_queries_rate_message" {
  description = "Custom message for Azure Search throttled queries rate monitor"
  type        = string
  default     = ""
}

variable "throttled_queries_rate_time_aggregator" {
  description = "Monitor aggregator for Azure Search throttled queries rate [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "throttled_queries_rate_timeframe" {
  description = "Monitor timeframe for Azure Search throttled queries rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "throttled_queries_rate_threshold_critical" {
  default     = 50
  description = "Alerting threshold for Azure Search throttled queries rate"
}

variable "throttled_queries_rate_threshold_warning" {
  default     = 25
  description = "Warning threshold for Azure Search throttled queries rate"
}

