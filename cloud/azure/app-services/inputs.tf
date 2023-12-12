# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:azure", "resource:app-services"]
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

variable "appservices_status_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Azure App Services specific variables

variable "response_time_enabled" {
  description = "Flag to enable App Services response time monitor"
  type        = string
  default     = "true"
}

variable "response_time_extra_tags" {
  description = "Extra tags for App Services response time monitor"
  type        = list(string)
  default     = []
}

variable "response_time_message" {
  description = "Custom message for App Services response time monitor"
  type        = string
  default     = ""
}

variable "response_time_time_aggregator" {
  description = "Monitor aggregator for App Services response time [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "response_time_timeframe" {
  description = "Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "response_time_threshold_critical" {
  default     = 10
  description = "Alerting threshold for response time in seconds"
}

variable "response_time_threshold_warning" {
  default     = 5
  description = "Warning threshold for response time in seconds"
}

variable "memory_usage_enabled" {
  description = "Flag to enable App Services memory usage monitor"
  type        = string
  default     = "true"
}

variable "memory_usage_extra_tags" {
  description = "Extra tags for App Services memory usage monitor"
  type        = list(string)
  default     = []
}

variable "memory_usage_message" {
  description = "Custom message for App Services memory usage monitor"
  type        = string
  default     = ""
}

variable "memory_usage_time_aggregator" {
  description = "Monitor aggregator for App Services memory usage [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "memory_usage_timeframe" {
  description = "Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "memory_usage_threshold_critical" {
  default     = 1073741824 # 1Gb
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default     = 536870912 # 512Mb
  description = "Warning threshold in MiB"
}

variable "http_4xx_requests_enabled" {
  description = "Flag to enable App Services 4xx requests monitor"
  type        = string
  default     = "true"
}

variable "http_4xx_requests_extra_tags" {
  description = "Extra tags for App Services 4xx requests monitor"
  type        = list(string)
  default     = []
}

variable "http_4xx_requests_message" {
  description = "Custom message for App Services 4xx requests monitor"
  type        = string
  default     = ""
}

variable "http_4xx_requests_time_aggregator" {
  description = "Monitor aggregator for App Services 4xx requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "http_4xx_requests_timeframe" {
  description = "Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_4xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 4xx errors"
}

variable "http_5xx_requests_enabled" {
  description = "Flag to enable App Services 5xx requests monitor"
  type        = string
  default     = "true"
}

variable "http_5xx_requests_extra_tags" {
  description = "Extra tags for App Services 5xx requests monitor"
  type        = list(string)
  default     = []
}

variable "http_5xx_requests_message" {
  description = "Custom message for App Services 5xx requests monitor"
  type        = string
  default     = ""
}

variable "http_5xx_requests_time_aggregator" {
  description = "Monitor aggregator for App Services 5xx requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "http_5xx_requests_timeframe" {
  description = "Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_5xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "http_5xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 5xx errors"
}

variable "http_successful_requests_enabled" {
  description = "Flag to enable App Services successful requests monitor"
  type        = string
  default     = "true"
}

variable "http_successful_requests_extra_tags" {
  description = "Extra tags for App Services successful requests monitor"
  type        = list(string)
  default     = []
}

variable "http_successful_requests_message" {
  description = "Custom message for App Services successful requests monitor"
  type        = string
  default     = ""
}

variable "http_successful_requests_time_aggregator" {
  description = "Monitor aggregator for App Services successful requests [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "http_successful_requests_timeframe" {
  description = "Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_successful_requests_threshold_critical" {
  default     = 10
  description = "Minimum critical acceptable percent of 2xx & 3xx requests"
}

variable "http_successful_requests_threshold_warning" {
  default     = 30
  description = "Warning regarding acceptable percent of 2xx & 3xx requests"
}

variable "status_enabled" {
  description = "Flag to enable App Services status monitor"
  type        = string
  default     = "true"
}

variable "status_message" {
  description = "Custom message for App Services status monitor"
  type        = string
  default     = ""
}

variable "status_extra_tags" {
  description = "Extra tags for App Services status monitor"
  type        = list(string)
  default     = []
}

variable "status_time_aggregator" {
  description = "Monitor aggregator for App Services status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "status_timeframe" {
  description = "Monitor timeframe for App Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "minimum_traffic" {
  description = "Minimum traffic to have for requests status alerts to avoid false triggering."
  type        = number
  default     = 20
}
