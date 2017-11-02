variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "client_name" {
  description = "Client Name"
  type        = "string"
}

variable "use_filter_tags" {
  description = "Filter the data with service tags if true"
  default     = "true"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

###################################
###   RESPONSE TIME VARIABLES   ###
###################################

variable "response_time_threshold_critical" {
  default     = 0.8
  description = "Alerting threshold in seconds"
}

variable "response_time_threshold_warning" {
  default     = 0.4
  description = "Warning threshold in seconds"
}

variable "response_time_last_time_window_code" {
  default     = "1h"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "response_time_require_full_window" {
  default     = false
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise."
}

variable "response_time_tags" {
  default     = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "response_time_timeout_h" {
  default     = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

# variable "response_time_notify_no_data" {
#   default = true
#   description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
# }

###################################
###   MEMORY USAGE VARIABLES   ###
###################################

variable "memory_usage_threshold_critical" {
  default     = 52430000
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default     = 33550000
  description = "Warning threshold in MiB"
}

variable "memory_usage_last_time_window_code" {
  default     = "5m"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "memory_usage_require_full_window" {
  default     = false
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise."
}

variable "memory_usage_tags" {
  default     = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "memory_usage_timeout_h" {
  default     = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

# variable "memory_usage_notify_no_data" {
#   default = true
#   description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
# }

#################################
###   HTTP 404 status pages   ###
#################################

variable "http_404_errors_count_rate_limit" {
  default = 30
}

variable "http_404_errors_count_rate_threshold_critical" {
  default     = 30
  description = "Alerting threshold (number of requests)"
}

variable "http_404_errors_count_rate_threshold_warning" {
  default     = 10
  description = "Warning threshold (number of requests)"
}

variable "http_404_errors_count_rate_last_time_window_code" {
  default     = "5m"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "http_404_errors_count_rate_require_full_window" {
  default     = true
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise."
}

variable "http_404_errors_count_rate_tags" {
  default     = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "http_404_errors_count_rate_timeout_h" {
  default     = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

# variable "http_404_errors_count_rate_notify_no_data" {
#   default = true
#   description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
# }

#################################
###   HTTP 202 status pages   ###
#################################

variable "http_2xx_status_rate_limit" {
  default = 30
}

variable "http_2xx_status_rate_threshold_critical" {
  default     = 0.9
  description = "Alerting threshold (percentage)"
}

variable "http_2xx_status_rate_threshold_warning" {
  default     = 0.95
  description = "Warning threshold (percentage)"
}

variable "http_2xx_status_rate_last_time_window_code" {
  default     = "5m"
  description = "Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2)"
}

variable "http_2xx_status_rate_require_full_window" {
  default     = true
  description = "A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise."
}

variable "http_2xx_status_rate_tags" {
  default     = []
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
}

variable "http_2xx_status_rate_timeout_h" {
  default     = false
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false."
}

# variable "http_2xx_status_rate_notify_no_data" {
#   default = true
#   description = " boolean indicating whether this monitor will notify when data stops reporting. Defaults to true."
# }

