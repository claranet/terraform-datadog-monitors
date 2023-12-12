# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:cloud", "provider:gcp", "resource:lb"]
}

# Global DataDog
variable "filter_tags" {
  description = "Tags used for filtering"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

variable "new_host_delay" {
  description = "Delay in seconds for the new host evaluation"
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

#
# 4XX Errors
#
variable "error_rate_4xx_message" {
  description = "Custom message for the GCP LB 4XX Errors monitor"
  type        = string
  default     = ""
}

variable "error_rate_4xx_time_aggregator" {
  description = "Timeframe for the GCP LB 4XX Errors monitor"
  type        = string
  default     = "min"
}

variable "error_rate_4xx_timeframe" {
  description = "Timeframe for the GCP LB 4XX Errors monitor"
  type        = string
  default     = "last_5m"
}

variable "error_rate_4xx_artificial_request" {
  description = "Divisor Delta for the GCP LB 4XX Errors monitor"
  type        = string
  default     = 5
}

variable "error_rate_4xx_threshold_warning" {
  description = "Rate error in percentage (warning threshold)"
  type        = string
  default     = 50
}

variable "error_rate_4xx_threshold_critical" {
  description = "Rate error in percentage (critical threshold)"
  type        = string
  default     = 60
}

variable "error_rate_4xx_enabled" {
  description = "Flag to enable GCP LB 4XX Errors monitor"
  type        = string
  default     = "true"
}

variable "error_rate_4xx_extra_tags" {
  description = "Extra tags for GCP LB 4XX Errors monitor"
  type        = list(string)
  default     = []
}

#
# 5XX Errors
#
variable "error_rate_5xx_message" {
  description = "Custom message for the GCP LB 5XX Errors monitor"
  type        = string
  default     = ""
}

variable "error_rate_5xx_time_aggregator" {
  description = "Timeframe for the GCP LB 5XX Errors monitor"
  type        = string
  default     = "min"
}

variable "error_rate_5xx_timeframe" {
  description = "Timeframe for the GCP LB 5XX Errors monitor"
  type        = string
  default     = "last_5m"
}

variable "error_rate_5xx_artificial_request" {
  description = "Divisor Delta for the GCP LB 5XX Errors monitor"
  type        = string
  default     = 5
}

variable "error_rate_5xx_threshold_warning" {
  description = "Rate error in percentage (warning threshold)"
  type        = string
  default     = 30
}

variable "error_rate_5xx_threshold_critical" {
  description = "Rate error in percentage (critical threshold)"
  type        = string
  default     = 40
}

variable "error_rate_5xx_enabled" {
  description = "Flag to enable GCP LB 5XX Errors monitor"
  type        = string
  default     = "true"
}

variable "error_rate_5xx_extra_tags" {
  description = "Extra tags for GCP LB 5XX Errors monitor"
  type        = list(string)
  default     = []
}

#
# Latency Backend service
#
variable "backend_latency_service_message" {
  description = "Custom message for the GCP LB Backend Latency monitor"
  type        = string
  default     = ""
}

variable "backend_latency_service_time_aggregator" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = string
  default     = "min"
}

variable "backend_latency_service_timeframe" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = string
  default     = "last_10m"
}

variable "backend_latency_service_threshold_warning" {
  description = "Latency in milliseconds (warning threshold)"
  type        = string
  default     = 1000
}

variable "backend_latency_service_threshold_critical" {
  description = "Latency in milliseconds (critical threshold)"
  type        = string
  default     = 1500
}

variable "backend_latency_service_enabled" {
  description = "Flag to enable GCP LB Backend Latency monitor"
  type        = string
  default     = "true"
}

variable "backend_latency_service_extra_tags" {
  description = "Extra tags for GCP LB Backend Latency monitor"
  type        = list(string)
  default     = []
}

#
# Latency Backend bucket
#
variable "backend_latency_bucket_message" {
  description = "Custom message for the GCP LB Backend Latency monitor"
  type        = string
  default     = ""
}

variable "backend_latency_bucket_time_aggregator" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = string
  default     = "min"
}

variable "backend_latency_bucket_timeframe" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = string
  default     = "last_10m"
}

variable "backend_latency_bucket_threshold_warning" {
  description = "Latency in milliseconds (warning threshold)"
  type        = string
  default     = 4000
}

variable "backend_latency_bucket_threshold_critical" {
  description = "Latency in milliseconds (critical threshold)"
  type        = string
  default     = 8000
}

variable "backend_latency_bucket_enabled" {
  description = "Flag to enable GCP LB Backend Latency monitor"
  type        = string
  default     = "true"
}

variable "backend_latency_bucket_extra_tags" {
  description = "Extra tags for GCP LB Backend Latency monitor"
  type        = list(string)
  default     = []
}

#
# Request Count
#
variable "request_count_message" {
  description = "Custom message for the GCP LB Request Count monitor"
  type        = string
  default     = ""
}

variable "request_count_time_aggregator" {
  description = "Timeframe for the GCP LB Request Count monitor"
  type        = string
  default     = "sum"
}

variable "request_count_timeframe" {
  description = "Timeframe for the GCP LB Request Count monitor"
  type        = string
  default     = "last_5m"
}

variable "request_count_timeshift" {
  description = "Timeshift for the GCP LB Request Count monitor"
  type        = string
  default     = "last_5m"
}

variable "request_count_threshold_warning" {
  description = "Desviation in percentage (warning threshold)"
  type        = string
  default     = 250
}

variable "request_count_threshold_critical" {
  description = "Desviation in percentage (critical threshold)"
  type        = string
  default     = 500
}

variable "request_count_enabled" {
  description = "Flag to enable GCP LB Request Count monitor"
  type        = string
  default     = "true"
}

variable "request_count_extra_tags" {
  description = "Extra tags for GCP LB Request Count monitor"
  type        = list(string)
  default     = []
}

