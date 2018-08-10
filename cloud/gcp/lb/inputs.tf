#
# Datadog global variables
#
variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 900
}

#
# Filter variables
#
variable "project_id" {
  type        = "string"
  description = "ID of the GCP Project"
}

#
# 4XX Errors
#
variable "error_rate_4xx_message" {
  description = "Custom message for the GCP LB 4XX Errors monitor"
  type        = "string"
  default     = ""
}

variable "error_rate_4xx_time_aggregator" {
  description = "Timeframe for the GCP LB 4XX Errors monitor"
  type        = "string"
  default     = "sum"
}

variable "error_rate_4xx_timeframe" {
  description = "Timeframe for the GCP LB 4XX Errors monitor"
  type        = "string"
  default     = "last_5m"
}

variable "error_rate_4xx_artificial_request" {
  description = "Divisor Delta for the GCP LB 4XX Errors monitor"
  type        = "string"
  default     = 5
}

variable "error_rate_4xx_threshold_critical" {
  description = "Rate error in percentage (critical threshold)"
  type        = "string"
  default     = 50
}

variable "error_rate_4xx_silenced" {
  description = "Groups to mute for GCP LB 4XX Errors monitor"
  type        = "map"
  default     = {}
}

variable "error_rate_4xx_extra_tags" {
  description = "Extra tags for GCP LB 4XX Errors monitor"
  type        = "list"
  default     = []
}

#
# 5XX Errors
#
variable "error_rate_5xx_message" {
  description = "Custom message for the GCP LB 5XX Errors monitor"
  type        = "string"
  default     = ""
}

variable "error_rate_5xx_time_aggregator" {
  description = "Timeframe for the GCP LB 5XX Errors monitor"
  type        = "string"
  default     = "sum"
}

variable "error_rate_5xx_timeframe" {
  description = "Timeframe for the GCP LB 5XX Errors monitor"
  type        = "string"
  default     = "last_5m"
}

variable "error_rate_5xx_artificial_request" {
  description = "Divisor Delta for the GCP LB 5XX Errors monitor"
  type        = "string"
  default     = 5
}

variable "error_rate_5xx_threshold_critical" {
  description = "Rate error in percentage (critical threshold)"
  type        = "string"
  default     = 50
}

variable "error_rate_5xx_silenced" {
  description = "Groups to mute for GCP LB 5XX Errors monitor"
  type        = "map"
  default     = {}
}

variable "error_rate_5xx_extra_tags" {
  description = "Extra tags for GCP LB 5XX Errors monitor"
  type        = "list"
  default     = []
}

#
# Latency
#
variable "latency_message" {
  description = "Custom message for the GCP LB Latency monitor"
  type        = "string"
  default     = ""
}

variable "latency_time_aggregator" {
  description = "Timeframe for the GCP LB Latency monitor"
  type        = "string"
  default     = "min"
}

variable "latency_timeframe" {
  description = "Timeframe for the GCP LB Latency monitor"
  type        = "string"
  default     = "last_10m"
}

variable "latency_threshold_warning" {
  description = "Latency in seconds (warning threshold)"
  type        = "string"
  default     = 3000
}

variable "latency_threshold_critical" {
  description = "Latency in seconds (critical threshold)"
  type        = "string"
  default     = 5000
}

variable "latency_silenced" {
  description = "Groups to mute for GCP LB Latency monitor"
  type        = "map"
  default     = {}
}

variable "latency_extra_tags" {
  description = "Extra tags for GCP LB Latency monitor"
  type        = "list"
  default     = []
}

#
# Latency Backend
#
variable "backend_latency_message" {
  description = "Custom message for the GCP LB Backend Latency monitor"
  type        = "string"
  default     = ""
}

variable "backend_latency_time_aggregator" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = "string"
  default     = "min"
}

variable "backend_latency_timeframe" {
  description = "Timeframe for the GCP LB Backend Latency monitor"
  type        = "string"
  default     = "last_10m"
}

variable "backend_latency_threshold_warning" {
  description = "Latency in seconds (warning threshold)"
  type        = "string"
  default     = 2000
}

variable "backend_latency_threshold_critical" {
  description = "Latency in seconds (critical threshold)"
  type        = "string"
  default     = 4000
}

variable "backend_latency_silenced" {
  description = "Groups to mute for GCP LB Backend Latency monitor"
  type        = "map"
  default     = {}
}

variable "backend_latency_extra_tags" {
  description = "Extra tags for GCP LB Backend Latency monitor"
  type        = "list"
  default     = []
}

#
# Request Count
#
variable "request_count_message" {
  description = "Custom message for the GCP LB Request Count monitor"
  type        = "string"
  default     = ""
}

variable "request_count_time_aggregator" {
  description = "Timeframe for the GCP LB Request Count monitor"
  type        = "string"
  default     = "sum"
}

variable "request_count_timeframe" {
  description = "Timeframe for the GCP LB Request Count monitor"
  type        = "string"
  default     = "last_5m"
}

variable "request_count_timeshift" {
  description = "Timeshift for the GCP LB Request Count monitor"
  type        = "string"
  default     = "last_5m"
}

variable "request_count_threshold_warning" {
  description = "Desviation in percentage (warning threshold)"
  type        = "string"
  default     = 250
}

variable "request_count_threshold_critical" {
  description = "Desviation in percentage (critical threshold)"
  type        = "string"
  default     = 500
}

variable "request_count_silenced" {
  description = "Groups to mute for GCP LB Request Count monitor"
  type        = "map"
  default     = {}
}

variable "request_count_extra_tags" {
  description = "Extra tags for GCP LB Request Count monitor"
  type        = "list"
  default     = []
}
