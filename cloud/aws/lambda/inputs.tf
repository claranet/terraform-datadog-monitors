# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:aws", "resource:lambda"]
}

# Global DataDog
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

# Datadog monitors variables

# Percentage of errors
variable "pct_errors_enabled" {
  description = "Flag to enable Percentage of errors monitor"
  type        = string
  default     = "true"
}

variable "pct_errors_extra_tags" {
  description = "Extra tags for Percentage of errors monitor"
  type        = list(string)
  default     = []
}

variable "pct_errors_message" {
  description = "Custom message for Percentage of errors monitor"
  type        = string
  default     = ""
}

variable "pct_errors_time_aggregator" {
  description = "Monitor aggregator for Percentage of errors [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "pct_errors_timeframe" {
  description = "Monitor timeframe for Percentage of errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1h"
}

variable "pct_errors_threshold_critical" {
  default     = 30
  description = "Alerting threshold in percentage"
}

variable "pct_errors_threshold_warning" {
  default     = 20
  description = "Warning threshold in percentage"
}

# Errors count
variable "errors_enabled" {
  description = "Flag to enable Errors monitor"
  type        = string
  default     = "false"
}

variable "errors_extra_tags" {
  description = "Extra tags for Errors monitor"
  type        = list(string)
  default     = []
}

variable "errors_message" {
  description = "Custom message for Errors monitor"
  type        = string
  default     = ""
}

variable "errors_time_aggregator" {
  description = "Monitor aggregator for Errors [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "errors_timeframe" {
  description = "Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1h"
}

variable "errors_threshold_critical" {
  default     = 3
  description = "Alerting threshold in milliseconds"
}

variable "errors_threshold_warning" {
  default     = 1
  description = "Warning threshold in milliseconds"
}

# Throttles count
variable "throttles_enabled" {
  description = "Flag to enable Throttles monitor"
  type        = string
  default     = "true"
}

variable "throttles_extra_tags" {
  description = "Extra tags for Throttles monitor"
  type        = list(string)
  default     = []
}

variable "throttles_message" {
  description = "Custom message for Throttles monitor"
  type        = string
  default     = ""
}

variable "throttles_time_aggregator" {
  description = "Monitor aggregator for Throttles [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "throttles_timeframe" {
  description = "Monitor timeframe for Throttles [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1h"
}

variable "throttles_threshold_critical" {
  default     = 3
  description = "Alerting threshold in number of throttles"
}

variable "throttles_threshold_warning" {
  default     = 1
  description = "Warning threshold in number of throttles"
}

# Invocations
variable "invocations_enabled" {
  description = "Flag to enable Invocations monitor"
  type        = string
  default     = "false"
}

variable "invocations_extra_tags" {
  description = "Extra tags for Invocations monitor"
  type        = list(string)
  default     = []
}

variable "invocations_message" {
  description = "Custom message for Invocations monitor"
  type        = string
  default     = ""
}

variable "invocations_time_aggregator" {
  description = "Monitor aggregator for Invocations [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "invocations_timeframe" {
  description = "Monitor timeframe for Invocations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "invocations_threshold_critical" {
  default     = 1
  description = "Alerting threshold in number of invocations"
}

variable "invocations_threshold_warning" {
  default     = 2
  description = "Warning threshold in number of invocations"
}

variable "invocations_no_data_timeframe" {
  default     = 120
  description = "Timeframe to check before alerting on no data in minutes"
}
