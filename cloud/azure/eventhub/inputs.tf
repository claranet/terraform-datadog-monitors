# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:eventhub"]
}

# Global DataDog
variable "message" {
  description = "Message sent when an alert is triggered"
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

variable "eventhub_status_no_data_timeframe" {
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

# Azure Event Hub specific variables

variable "status_enabled" {
  description = "Flag to enable Event Hub status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Event Hub status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for Event Hub status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Event Hub status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_requests_rate_enabled" {
  description = "Flag to enable Event Hub failed requests monitor"
  type        = string
  default     = "true"
}

variable "failed_requests_rate_extra_tags" {
  description = "Extra tags for Event Hub failed requests monitor"
  type        = list(string)
  default     = []
}

variable "failed_requests_rate_message" {
  description = "Custom message for Event Hub failed requests monitor"
  type        = string
  default     = ""
}

variable "failed_requests_rate_time_aggregator" {
  description = "Monitor aggregator for Event Hub failed requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "failed_requests_rate_timeframe" {
  description = "Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_requests_rate_thresold_critical" {
  description = "Failed requests ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "failed_requests_rate_thresold_warning" {
  description = "Failed requests ratio (percentage) to trigger a warning alert"
  default     = 50
}

variable "errors_rate_enabled" {
  description = "Flag to enable Event Hub errors monitor"
  type        = string
  default     = "true"
}

variable "errors_rate_extra_tags" {
  description = "Extra tags for Event Hub errors monitor"
  type        = list(string)
  default     = []
}

variable "errors_rate_message" {
  description = "Custom message for Event Hub errors monitor"
  type        = string
  default     = ""
}

variable "errors_rate_time_aggregator" {
  description = "Monitor aggregator for Event Hub errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "errors_rate_timeframe" {
  description = "Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "errors_rate_thresold_critical" {
  description = "Errors ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "errors_rate_thresold_warning" {
  description = "Errors ratio (percentage) to trigger a warning alert"
  default     = 50
}

