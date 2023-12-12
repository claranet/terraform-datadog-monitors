# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:apimanagement"]
}

# Global DataDog
variable "message" {
  description = "Message sent when a Redis monitor is triggered"
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

variable "apimgt_status_no_data_timeframe" {
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

# Azure API Management specific

variable "status_enabled" {
  description = "Flag to enable API Management status monitor"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for API Management status monitor"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for API Management status monitor"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for API Management status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_requests_enabled" {
  description = "Flag to enable API Management failed requests monitor"
  type        = string
  default     = "true"
}

variable "failed_requests_extra_tags" {
  description = "Extra tags for API Management failed requests monitor"
  type        = list(string)
  default     = []
}

variable "failed_requests_message" {
  description = "Custom message for API Management failed requests monitor"
  type        = string
  default     = ""
}

variable "failed_requests_time_aggregator" {
  description = "Monitor aggregator for API Management failed requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "failed_requests_timeframe" {
  description = "Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "failed_requests_threshold_critical" {
  description = "Maximum acceptable percent of failed requests"
  default     = 90
}

variable "failed_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of failed requests"
  default     = 50
}

variable "other_requests_enabled" {
  description = "Flag to enable API Management other requests monitor"
  type        = string
  default     = "true"
}

variable "other_requests_extra_tags" {
  description = "Extra tags for API Management other requests monitor"
  type        = list(string)
  default     = []
}

variable "other_requests_message" {
  description = "Custom message for API Management other requests monitor"
  type        = string
  default     = ""
}

variable "other_requests_time_aggregator" {
  description = "Monitor aggregator for API Management other requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "other_requests_timeframe" {
  description = "Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "other_requests_threshold_critical" {
  description = "Maximum acceptable percent of other requests"
  default     = 90
}

variable "other_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of other requests"
  default     = 50
}

variable "unauthorized_requests_enabled" {
  description = "Flag to enable API Management unauthorized requests monitor"
  type        = string
  default     = "true"
}

variable "unauthorized_requests_extra_tags" {
  description = "Extra tags for API Management unauthorized requests monitor"
  type        = list(string)
  default     = []
}

variable "unauthorized_requests_message" {
  description = "Custom message for API Management unauthorized requests monitor"
  type        = string
  default     = ""
}

variable "unauthorized_requests_time_aggregator" {
  description = "Monitor aggregator for API Management unauthorized requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "unauthorized_requests_timeframe" {
  description = "Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "unauthorized_requests_threshold_critical" {
  description = "Maximum acceptable percent of unauthorized requests"
  default     = 90
}

variable "unauthorized_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of unauthorized requests"
  default     = 50
}

variable "successful_requests_enabled" {
  description = "Flag to enable API Management successful requests monitor"
  type        = string
  default     = "true"
}

variable "successful_requests_extra_tags" {
  description = "Extra tags for API Management successful requests monitor"
  type        = list(string)
  default     = []
}

variable "successful_requests_message" {
  description = "Custom message for API Management successful requests monitor"
  type        = string
  default     = ""
}

variable "successful_requests_time_aggregator" {
  description = "Monitor aggregator for API Management successful requests [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "successful_requests_timeframe" {
  description = "Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests"
  default     = 10
}

variable "successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests"
  default     = 30
}

variable "minimum_traffic" {
  description = "Minimum traffic to have for requests status alerts to avoid false triggering."
  type        = number
  default     = 20
}
