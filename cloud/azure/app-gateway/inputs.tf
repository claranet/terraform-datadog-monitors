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

# Azure App Gateway specific variables
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
  default     = "min"
}

variable "status_timeframe" {
  description = "Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring App Gateway current_connections
variable "current_connection_enabled" {
  description = "Flag to enable App Gateway current connections monitor"
  type        = string
  default     = "true"
}

variable "current_connection_extra_tags" {
  description = "Extra tags for App Gateway current connections monitor"
  type        = list(string)
  default     = []
}

variable "current_connection_message" {
  description = "Custom message for App Gateway current connections monitor"
  type        = string
  default     = ""
}

variable "current_connection_time_aggregator" {
  description = "Monitor aggregator for App Gateway current connections [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "current_connection_timeframe" {
  description = "Monitor timeframe for App Gateway current connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring App Gateway failed_requests
variable "appgateway_backend_connect_time_enabled" {
  description = "Flag to enable App Gateway backend_connect_time monitor"
  type        = string
  default     = "true"
}

variable "appgateway_backend_connect_time_extra_tags" {
  description = "Extra tags for App Gateway backend_connect_time monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_backend_connect_time_message" {
  description = "Custom message for App Gateway backend_connect_time monitor"
  type        = string
  default     = ""
}

variable "appgateway_backend_connect_time_time_aggregator" {
  description = "Monitor aggregator for App Gateway backend_connect_time [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "appgateway_backend_connect_time_timeframe" {
  description = "Monitor timeframe for App Gateway backend_connect_time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_backend_connect_time_threshold_critical" {
  default     = 50
  description = "Maximum critical backend_connect_time errors"
}

variable "appgateway_backend_connect_time_threshold_warning" {
  default     = 40
  description = "Warning regarding backend_connect_time errors"
}

# Monitoring App Gateway failed_requests
variable "appgateway_failed_requests_enabled" {
  description = "Flag to enable App Gateway failed requests monitor"
  type        = string
  default     = "true"
}

variable "appgateway_failed_requests_extra_tags" {
  description = "Extra tags for App Gateway failed requests monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_failed_requests_message" {
  description = "Custom message for App Gateway failed requests monitor"
  type        = string
  default     = ""
}

variable "appgateway_failed_requests_time_aggregator" {
  description = "Monitor aggregator for App Gateway failed requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "appgateway_failed_requests_timeframe" {
  description = "Monitor timeframe for App Gateway failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_failed_requests_threshold_critical" {
  default     = 50
  description = "Maximum critical acceptable percent of failed errors"
}

variable "appgateway_failed_requests_threshold_warning" {
  default     = 40
  description = "Warning regarding acceptable percent of failed errors"
}

# Monitoring App Gateway healthy_host_count
variable "appgateway_healthy_host_count_enabled" {
  description = "Flag to enable App Gateway healthy host monitor"
  type        = string
  default     = "true"
}

variable "appgateway_healthy_host_count_extra_tags" {
  description = "Extra tags for App Gateway healthy host monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_healthy_host_count_message" {
  description = "Custom message for App Gateway healthy host monitor"
  type        = string
  default     = ""
}

variable "appgateway_healthy_host_count_time_aggregator" {
  description = "Monitor aggregator for App Gateway healthy host [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "appgateway_healthy_host_count_timeframe" {
  description = "Monitor timeframe for App Gateway healthy host [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

# Monitoring App Gateway response_status 4xx
variable "appgateway_http_4xx_errors_enabled" {
  description = "Flag to enable App Gateway http 4xx errors monitor"
  type        = string
  default     = "true"
}

variable "appgateway_http_4xx_errors_extra_tags" {
  description = "Extra tags for App Gateway http 4xx errors monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_http_4xx_errors_message" {
  description = "Custom message for App Gateway http 4xx errors monitor"
  type        = string
  default     = ""
}

variable "appgateway_http_4xx_errors_time_aggregator" {
  description = "Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "appgateway_http_4xx_errors_timeframe" {
  description = "Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_http_4xx_errors_threshold_critical" {
  default     = 30
  description = "Minimum critical acceptable percent of 4xx error"
}

variable "appgateway_http_4xx_errors_threshold_warning" {
  default     = 20
  description = "Warning regarding acceptable percent of 4xx error"
}

# Monitoring App Gateway response_status 5xx
variable "appgateway_http_5xx_errors_enabled" {
  description = "Flag to enable App Gateway http 5xx errors monitor"
  type        = string
  default     = "true"
}

variable "appgateway_http_5xx_errors_extra_tags" {
  description = "Extra tags for App Gateway http 5xx errors monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_http_5xx_errors_message" {
  description = "Custom message for App Gateway http 5xx errors monitor"
  type        = string
  default     = ""
}

variable "appgateway_http_5xx_errors_time_aggregator" {
  description = "Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "appgateway_http_5xx_errors_timeframe" {
  description = "Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_http_5xx_errors_threshold_critical" {
  default     = 30
  description = "Minimum critical acceptable percent of 5xx error"
}

variable "appgateway_http_5xx_errors_threshold_warning" {
  default     = 20
  description = "Warning regarding acceptable percent of 5xx error"
}

# Monitoring App Gateway Backend response_status 4xx
variable "appgateway_backend_http_4xx_errors_enabled" {
  description = "Flag to enable App Gateway http 4xx errors monitor"
  type        = string
  default     = "true"
}

variable "appgateway_backend_http_4xx_errors_extra_tags" {
  description = "Extra tags for App Gateway http 4xx errors monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_backend_http_4xx_errors_message" {
  description = "Custom message for App Gateway http 4xx errors monitor"
  type        = string
  default     = ""
}

variable "appgateway_backend_http_4xx_errors_time_aggregator" {
  description = "Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "appgateway_backend_http_4xx_errors_timeframe" {
  description = "Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_backend_http_4xx_errors_threshold_critical" {
  default     = 30
  description = "Minimum critical acceptable percent of 4xx error"
}

variable "appgateway_backend_http_4xx_errors_threshold_warning" {
  default     = 20
  description = "Warning regarding acceptable percent of 4xx error"
}

# Monitoring App Gateway Backend response_status 5xx
variable "appgateway_backend_http_5xx_errors_enabled" {
  description = "Flag to enable App Gateway http 5xx errors monitor"
  type        = string
  default     = "true"
}

variable "appgateway_backend_http_5xx_errors_extra_tags" {
  description = "Extra tags for App Gateway http 5xx errors monitor"
  type        = list(string)
  default     = []
}

variable "appgateway_backend_http_5xx_errors_message" {
  description = "Custom message for App Gateway http 5xx errors monitor"
  type        = string
  default     = ""
}

variable "appgateway_backend_http_5xx_errors_time_aggregator" {
  description = "Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "appgateway_backend_http_5xx_errors_timeframe" {
  description = "Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "appgateway_backend_http_5xx_errors_threshold_critical" {
  default     = 30
  description = "Minimum critical acceptable percent of 5xx error"
}

variable "appgateway_backend_http_5xx_errors_threshold_warning" {
  default     = 20
  description = "Warning regarding acceptable percent of 5xx error"
}
