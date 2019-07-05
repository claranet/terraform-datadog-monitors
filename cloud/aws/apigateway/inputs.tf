variable "environment" {
  description = "Environment"
  type        = string
}

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
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

###################################
###   LATENCY VARIABLES   ###
###################################

variable "latency_enabled" {
  description = "Flag to enable API Gateway latency monitor"
  type        = string
  default     = "true"
}

variable "latency_extra_tags" {
  description = "Extra tags for API Gateway latency monitor"
  type        = list(string)
  default     = []
}

variable "latency_message" {
  description = "Custom message for API Gateway latency monitor"
  type        = string
  default     = ""
}

variable "latency_time_aggregator" {
  description = "Monitor aggregator for API Gateway latency [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "latency_timeframe" {
  description = "Monitor timeframe for API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "latency_threshold_critical" {
  default     = 800
  description = "Alerting threshold in milliseconds"
}

variable "latency_threshold_warning" {
  default     = 400
  description = "Warning threshold in milliseconds"
}

#################################
###   HTTP 5xx status pages   ###
#################################

variable "http_5xx_requests_enabled" {
  description = "Flag to enable API Gateway HTTP 5xx requests monitor"
  type        = string
  default     = "true"
}

variable "http_5xx_requests_extra_tags" {
  description = "Extra tags for API Gateway HTTP 5xx requests monitor"
  type        = list(string)
  default     = []
}

variable "http_5xx_requests_message" {
  description = "Custom message for API Gateway HTTP 5xx requests monitor"
  type        = string
  default     = ""
}

variable "http_5xx_requests_time_aggregator" {
  description = "Monitor aggregator for API HTTP 5xx requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "http_5xx_requests_timeframe" {
  description = "Monitor timeframe for API HTTP 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_5xx_requests_threshold_critical" {
  default     = 20
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "http_5xx_requests_threshold_warning" {
  default     = 10
  description = "Maximum warning acceptable percent of 5xx errors"
}

#################################
###   HTTP 4xx status pages   ###
#################################

variable "http_4xx_requests_enabled" {
  description = "Flag to enable API Gateway HTTP 4xx requests monitor"
  type        = string
  default     = "true"
}

variable "http_4xx_requests_extra_tags" {
  description = "Extra tags for API Gateway HTTP 4xx requests monitor"
  type        = list(string)
  default     = []
}

variable "http_4xx_requests_message" {
  description = "Custom message for API Gateway HTTP 4xx requests monitor"
  type        = string
  default     = ""
}

variable "http_4xx_requests_time_aggregator" {
  description = "Monitor aggregator for API HTTP 4xx requests [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "http_4xx_requests_timeframe" {
  description = "Monitor timeframe for API HTTP 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "http_4xx_requests_threshold_critical" {
  default     = 30
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 15
  description = "Maximum warning acceptable percent of 4xx errors"
}

variable "artificial_requests_count" {
  default     = 5
  description = "Number of false requests used to mitigate false positive in case of low trafic"
}

