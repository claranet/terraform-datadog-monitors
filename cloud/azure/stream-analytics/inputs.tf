# Global Terraform
variable "environment" {
  description = "Architecture environment"
  type        = "string"
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

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
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

# Azure Stream Analytics specific variables

variable "status_enabled" {
  description = "Flag to enable Stream Analytics status monitor"
  type        = "string"
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for Stream Analytics status monitor"
  type        = "list"
  default     = []
}

variable "status_message" {
  description = "Custom message for Stream Analytics status monitor"
  type        = "string"
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for Stream Analytics status [available values: min, max or avg]"
  type        = "string"
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for Stream Analytics status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "su_utilization_enabled" {
  description = "Flag to enable Stream Analytics utilization monitor"
  type        = "string"
  default     = "true"
}

variable "su_utilization_extra_tags" {
  description = "Extra tags for Stream Analytics utilization monitor"
  type        = "list"
  default     = []
}

variable "su_utilization_message" {
  description = "Custom message for Stream Analytics utilization monitor"
  type        = "string"
  default     = ""
}

variable "su_utilization_time_aggregator" {
  description = "Monitor aggregator for Stream Analytics utilization [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "su_utilization_timeframe" {
  description = "Monitor timeframe for Stream Analytics utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "su_utilization_threshold_warning" {
  description = "Streaming Unit utilization rate limit (warning threshold)"
  default     = 60
}

variable "su_utilization_threshold_critical" {
  description = "Streaming Unit utilization rate limit (critical threshold)"
  default     = 80
}

variable "failed_function_requests_enabled" {
  description = "Flag to enable Stream Analytics failed requests monitor"
  type        = "string"
  default     = "true"
}

variable "failed_function_requests_extra_tags" {
  description = "Extra tags for Stream Analytics failed requests monitor"
  type        = "list"
  default     = []
}

variable "failed_function_requests_message" {
  description = "Custom message for Stream Analytics failed requests monitor"
  type        = "string"
  default     = ""
}

variable "failed_function_requests_time_aggregator" {
  description = "Monitor aggregator for Stream Analytics failed requests [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "failed_function_requests_timeframe" {
  description = "Monitor timeframe for Stream Analytics failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "failed_function_requests_threshold_warning" {
  description = "Failed Function Request rate limit (warning threshold)"
  default     = 0
}

variable "failed_function_requests_threshold_critical" {
  description = "Failed Function Request rate limit (critical threshold)"
  default     = 10
}

variable "conversion_errors_enabled" {
  description = "Flag to enable Stream Analytics conversion errors monitor"
  type        = "string"
  default     = "true"
}

variable "conversion_errors_extra_tags" {
  description = "Extra tags for Stream Analytics conversion errors monitor"
  type        = "list"
  default     = []
}

variable "conversion_errors_message" {
  description = "Custom message for Stream Analytics conversion errors monitor"
  type        = "string"
  default     = ""
}

variable "conversion_errors_time_aggregator" {
  description = "Monitor aggregator for Stream Analytics conversion errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "conversion_errors_timeframe" {
  description = "Monitor timeframe for Stream Analytics conversion errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "conversion_errors_threshold_warning" {
  description = "Conversion errors limit (warning threshold)"
  default     = 0
}

variable "conversion_errors_threshold_critical" {
  description = "Conversion errors limit (critical threshold)"
  default     = 10
}

variable "runtime_errors_enabled" {
  description = "Flag to enable Stream Analytics runtime errors monitor"
  type        = "string"
  default     = "true"
}

variable "runtime_errors_extra_tags" {
  description = "Extra tags for Stream Analytics runtime errors monitor"
  type        = "list"
  default     = []
}

variable "runtime_errors_message" {
  description = "Custom message for Stream Analytics runtime errors monitor"
  type        = "string"
  default     = ""
}

variable "runtime_errors_time_aggregator" {
  description = "Monitor aggregator for Stream Analytics runtime errors [available values: min, max or avg]"
  type        = "string"
  default     = "min"
}

variable "runtime_errors_timeframe" {
  description = "Monitor timeframe for Stream Analytics runtime errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = "string"
  default     = "last_5m"
}

variable "runtime_errors_threshold_warning" {
  description = "Runtime errors limit (warning threshold)"
  default     = 0
}

variable "runtime_errors_threshold_critical" {
  description = "Runtime errors limit (critical threshold)"
  default     = 10
}
