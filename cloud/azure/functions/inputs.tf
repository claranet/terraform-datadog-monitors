# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:azure_functions"]
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

# Azure Function App specific variables

variable "http_5xx_errors_rate_enabled" {
  description = "Flag to enable Functions Http 5xx errors rate monitor"
  type        = string
  default     = "true"
}

variable "http_5xx_errors_rate_extra_tags" {
  description = "Extra tags for Functions Http 5xx errors rate monitor"
  type        = list(string)
  default     = []
}

variable "http_5xx_errors_rate_message" {
  description = "Custom message for Functions Http 5xx errors rate monitor"
  type        = string
  default     = ""
}

variable "http_5xx_errors_rate_time_aggregator" {
  description = "Monitor aggregator for Functions Http 5xx errors rate [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "http_5xx_errors_rate_timeframe" {
  description = "Monitor timeframe for Functions Http 5xx errors rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_5xx_errors_rate_threshold_critical" {
  default     = 20
  description = "Alerting threshold for Functions Http 5xx errors rate"
}

variable "http_5xx_errors_rate_threshold_warning" {
  default     = 10
  description = "Warning threshold for Functions Http 5xx errors rate"
}

variable "high_connections_count_enabled" {
  description = "Flag to enable Functions high connections count monitor"
  type        = string
  default     = "true"
}

variable "high_connections_count_extra_tags" {
  description = "Extra tags for Functions high connections count monitor"
  type        = list(string)
  default     = []
}

variable "high_connections_count_message" {
  description = "Custom message for Functions high connections count monitor"
  type        = string
  default     = ""
}

variable "high_connections_count_time_aggregator" {
  description = "Monitor aggregator for Functions high connections count [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "high_connections_count_timeframe" {
  description = "Monitor timeframe for Functions high connections count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "high_connections_count_threshold_critical" {
  default     = 590
  description = "Alerting threshold for Functions high connections count"
}

variable "high_connections_count_threshold_warning" {
  default     = 550
  description = "Warning threshold for Functions high connections count"
}

variable "high_threads_count_enabled" {
  description = "Flag to enable Functions high threads count monitor"
  type        = string
  default     = "true"
}

variable "high_threads_count_extra_tags" {
  description = "Extra tags for Functions high threads count monitor"
  type        = list(string)
  default     = []
}

variable "high_threads_count_message" {
  description = "Custom message for Functions high threads count monitor"
  type        = string
  default     = ""
}

variable "high_threads_count_time_aggregator" {
  description = "Monitor aggregator for Functions high threads count [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "high_threads_count_timeframe" {
  description = "Monitor timeframe for Functions high threads count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "high_threads_count_threshold_critical" {
  default     = 510
  description = "Alerting threshold for Functions high threads count"
}

variable "high_threads_count_threshold_warning" {
  default     = 490
  description = "Warning threshold for Functions high threads count"
}

