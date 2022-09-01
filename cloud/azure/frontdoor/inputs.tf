# Azure App Gateway global variables
variable "environment" {
  description = "Architecture environment"
  type        = string
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

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

# Azure Front Door specific variables
# Monitoring App Gateway status
variable "status_enabled" {
  description = "Flag to enable App Gateway status"
  type        = string
  default     = "true"
}

variable "status_extra_tags" {
  description = "Extra tags for App Gateway status"
  type        = list(string)
  default     = []
}

variable "status_message" {
  description = "Custom message for App Gateway status"
  type        = string
  default     = ""
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for App Gateway status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "frontdoor_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Monitoring Front Door backend request latency
variable "frontdoor_backend_request_latency_enabled" {
  description = "Flag to enable Front Door backend request latency"
  type        = string
  default     = "true"
}

variable "frontdoor_backend_request_latency_extra_tags" {
  description = "Extra tags for Front Door backend request latency"
  type        = list(string)
  default     = []
}

variable "frontdoor_backend_request_latency_message" {
  description = "Custom message for Front Door backend request latency"
  type        = string
  default     = ""
}

variable "frontdoor_backend_request_latency_time_aggregator" {
  description = "Monitor aggregator for Front Door backend request latency [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "frontdoor_backend_request_latency_threshold_critical" {
  description = "Maximum acceptable end to end latency (ms) for Front Door backend request"
  type        = number
  default     = 1000
}

variable "frontdoor_backend_request_latency_threshold_warning" {
  description = "Warning threshold for Front Door backend request latency"
  type        = number
  default     = 500
}

variable "frontdoor_backend_request_latency_timeframe" {
  description = "Monitor timeframe for Front Door backend request latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring Front Door total latency
variable "frontdoor_total_latency_enabled" {
  description = "Flag to enable Front Door total latency"
  type        = string
  default     = "true"
}

variable "frontdoor_total_latency_extra_tags" {
  description = "Extra tags for Front Door total latency"
  type        = list(string)
  default     = []
}

variable "frontdoor_total_latency_message" {
  description = "Custom message for Front Door total latency"
  type        = string
  default     = ""
}

variable "frontdoor_total_latency_time_aggregator" {
  description = "Monitor aggregator for Front Door total latency [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "frontdoor_total_latency_threshold_critical" {
  description = "Maximum acceptable end to end total latency (ms) for Front Door"
  type        = number
  default     = 20
}

variable "frontdoor_total_latency_threshold_warning" {
  description = "Warning threshold for Front Door total lantency"
  type        = number
  default     = 15
}

variable "frontdoor_total_latency_timeframe" {
  description = "Monitor timeframe for Front Door total latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring Front Door request count
variable "frontdoor_request_count_enabled" {
  description = "Flag to enable Front Door request count"
  type        = string
  default     = "true"
}

variable "frontdoor_request_count_extra_tags" {
  description = "Extra tags for Front Door request count"
  type        = list(string)
  default     = []
}

variable "frontdoor_request_count_message" {
  description = "Custom message for Front Door request count"
  type        = string
  default     = ""
}

variable "frontdoor_request_count_time_aggregator" {
  description = "Monitor aggregator for Front Door request count [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "frontdoor_request_count_timeframe" {
  description = "Monitor timeframe for Front Door request count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring Front Door backend health
variable "frontdoor_backend_health_enabled" {
  description = "Flag to enable Front Door backend health"
  type        = string
  default     = "true"
}

variable "frontdoor_backend_health_extra_tags" {
  description = "Extra tags for Front Door backend health"
  type        = list(string)
  default     = []
}

variable "frontdoor_backend_health_message" {
  description = "Custom message for Front Door backend health"
  type        = string
  default     = ""
}

variable "frontdoor_backend_health_time_aggregator" {
  description = "Monitor aggregator for Front Door backend health [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "frontdoor_backend_health_timeframe" {
  description = "Monitor timeframe for Front Door backend health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "frontdoor_backend_health_threshold_critical" {
  description = "Maximum acceptable end to end backend health (ms) for Front Door"
  type        = number
  default     = 50
}

variable "frontdoor_backend_health_threshold_warning" {
  description = "Warning threshold for Front Door backend health"
  type        = number
  default     = 75
}
